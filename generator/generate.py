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
                 "want":"".join([ str(x) for x in want.contents] ),
                 "label":"case-%s" % n,}

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
    output = []
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
        
        output.append(udict)

    return output

if useorig:
    parsed = parse_orightml("../contracts_use_cases.html")
    parsed2 = parse_data("all_data.txt")
else:
    parsed2 = parse_orightml("../contracts_use_cases.html")
    parsed = parse_data("all_data.txt")

wsRe = re.compile("\s+")
categories = set()
keys = set()

for udict in parsed:
    udict["want"] = "\n".join(textwrap.wrap(wsRe.sub(" ",udict["want"]).strip(),79))

    if "description" in udict:
        desc = udict["description"]
        udict["descriptionmd"] = markdown.markdown(desc)

    if "categories" in udict:
        for c in re.split("\s+",udict["categories"]):
            c = c.strip()
            if c: categories.add(c)

    keys.update(udict.keys())

print("All keys: %s" % (sorted(keys),))
print("All categories: %s" % (sorted(categories),))
        
# merge anything in all_data that isn't in 'official' html file
for udict2 in parsed2:
    for udict in parsed:
        if udict["label"] == udict2["label"]:
            for k,v in udict2.items():
                if k not in udict:
                    udict[k] = v

for f in glob.glob("*.mako"):
    t = mako.template.Template(open("%s" % (f,)).read())
    r = t.render(parsed=parsed)
    open(os.path.join("generated",f.replace(".mako","")),"w").write(r)


#for p1,p2 in zip(parsed,parsed2):
#    for k,v in p1.items():
#        if k in p2:
#            v2 = p2[k]
#            if v != v2:
#                print("Diff (key %s): %s != %s" % (k,p1,p2,))

