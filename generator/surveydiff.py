#!/usr/bin/env python

import difflib

def clean(l):
    l = l.strip().replace("&lt;","<").replace("&gt;",">").replace("<i>","").replace("</i>","")
    return l

def munge(data):
    return [tuple([clean(l) for l in data[i:i+3]]) for i in range(0,len(data),15)]

surveydata = open("generated/survey.txt").readlines()
currentdata = open("generated/survey.current.txt").readlines()

surveydata = munge(surveydata)
currentdata = munge(currentdata)

sm = difflib.SequenceMatcher(a=currentdata,b=surveydata)

print("Expected size: %s" % (len(surveydata),))
print("Current size: %s" % (len(currentdata),))

opcodes = []
for oc in sm.get_opcodes():
    if oc[0] == "equal":
        continue
    elif oc[0] == "delete":
        for i in range(oc[1],oc[2]):
            opcodes.append( ("delete", i, i+1, i, i+1,) )
    else:
        opcodes.append(oc)

for oc in opcodes:
    if oc[0] == "delete":
        for i in range(oc[1],oc[2]):
            print("####Delete %s (%s)" % (i," ".join(currentdata[i]),))
            if currentdata[i] in surveydata:
                ndx = surveydata.index(currentdata[i])
                print("   ####(Moved to: %s)" % (ndx,))
            
            print("")
    elif oc[0] == "insert":
        print("#####Insert After %s (%s)" % (oc[1]-1," ".join(surveydata[oc[3]-1])))

        for i in range(oc[3],oc[4]):
            if surveydata[i] in currentdata:
                ndx = currentdata.index(surveydata[i])
                print("    ####(Moved from: %s)" % (ndx,))
                
            
            print("\n".join(surveydata[i]))
            print("")
    elif oc[0] == "replace":
        for n in range(0,oc[2]-oc[1]):
            print("####Replace %s (%s) With:" % (oc[1]+n," ".join(currentdata[oc[1]+n])))
            print("\n".join(surveydata[oc[3]+n]))
            print("")

