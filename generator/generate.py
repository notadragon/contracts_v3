#!/usr/bin/env python3

import glob
import sys
import re
import os
import os.path
import textwrap
import bs4
from builtins import str
import mako.template
import markdown

useorig = False

for arg in sys.argv:
    if arg == "-orig":
        useorig = True

def parse_orightml(f):
    root = bs4.BeautifulSoup(open(f),"lxml")

    output = []

    t1,t2 = root.find_all("table")

    for n,row in enumerate(t1.find_all("tr")[1:]):
        blank,asa,todo,want,blank2 = row.find_all("td")
        udict = {"asa":asa.text,
                 "todo":todo.text,
                 "want":"".join([ str(x) for x in want.contents] )}

        for a in row.find_all("a"):
            udict["label"] = a.text

        output.append(udict)

    for row in t2.find_all("tr"):
        label,text = row.find_all("td")
        label = label.a.text

        udict = None
        for u in output:
            if "label" in u and u["label"] == label:
                udict = u
                break

        if not udict:
            print("Unknown label in description table: %s" % (label,))
        else:
            udict["description"] = "".join(text.contents).strip()
            
    return output

def parse_data(f):
    output_categories = {}
    output_data = []
    alllabels = set()

    caseRe = re.compile("^--(?P<label>[^\n]*?)$\n^(?P<asa>[^\n]*?)$\n^(?P<todo>.*?)$\n(?P<want>.*?)\n(?P<rest>^==.*?)?^--$",re.MULTILINE|re.DOTALL)
    restRe = re.compile("^==([^\n]*?)$",re.MULTILINE|re.DOTALL)
    fdata = open(f).read()

    for m in caseRe.finditer(fdata):
        gd = m.groupdict()
        udict = { k:gd[k] for k in ["label","asa","todo","want"] }
        if "rest" in gd and gd["rest"]:
            rspl = restRe.split(gd["rest"])
            for k,v in zip(rspl[1::2],rspl[2::2]):
                udict[k] = v.strip()

        label = udict["label"]
        if label in alllabels:
            print("Duplicate Label: %s" % (label,))
        alllabels.add(label)
        
        output_data.append(udict)

    return (output_categories,output_data)

all_categories,all_data = parse_data("all_data.txt")

wsRe = re.compile("\s+")
categories = set()
keys = set()

# process markdown to html, do some other cleanup, check some invariants
for udict in all_data:
    udict["want"] = "\n".join(textwrap.wrap(wsRe.sub(" ",udict["want"]).strip(),79))

    if "description" in udict:
        desc = udict["description"]
        udict["descriptionmd"] = markdown.markdown(desc)

    if "categories" in udict:
        for c in re.split("\s+",udict["categories"]):
            c = c.strip()
            if c: categories.add(c)

    keys.update(udict.keys())

# spitting these out helps identify any typos in the keys or categories
print("All keys: %s" % (sorted(keys),))
print("All categories: %s" % (sorted(categories),))
        
for template in glob.glob("*.mako"):
    basename = template.replace(".mako","")

    if os.path.exists(os.path.join("..",basename)):
        outfile = os.path.join("..",basename)
    else:
        outfile = os.path.join("generated",basename)

    t = mako.template.Template(open("%s" % (template,)).read())
    r = t.render(all_categories=all_categories,all_data=all_data)

    if os.path.exists(outfile):
        currentdata = open(outfile).read()
    else:
        currentdata = None
    if r != currentdata:
        print("Updating generated file: %s" % (outfile,))
        open(outfile,"w").write(r)
    

html_data = parse_orightml("../contracts_use_cases.html")
for adata,hdata in zip(all_data,html_data):
    for key,value in hdata.items():
        if key not in adata or value != adata[key]:
            print("Key (%s) mismatch in html data for label %s" % (key,adata["label"]))
            print("  all value: %s" % (adata[key],))
            print("  html value: %s" % (value,))
