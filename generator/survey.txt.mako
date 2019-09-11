% for udict in all_data:
% for rest in [ "", " Not important", " Nice to have", " Must have"] :
% if rest:

% endif
As a\
%if udict["asa"][0] in "AEIO":
n\
%endif
: ${udict["asa"]}
In order to: ${udict["todo"]}
I want to: ${udict["want"].replace("\n"," ")}${rest}
% endfor
% endfor