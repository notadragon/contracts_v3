#--<label>
#<As A> (one line)
#<In Order To> (one line)
#<I Want To> (any number of lines
#
# For each additional piece of data, ==<key> followed by the key data
#==<key>
#<keydata>
#
# End with
#--

% for udict in all_data:
--${udict["label"]}
${udict["asa"]}
${udict["todo"]}
${udict["want"]}
% for key,data in udict.items():
% if key not in ["label","asa","todo","want","description"]:
==${key}
${data}
%endif
%endfor
% if "description" in udict:
==description
${udict["description"]}
% endif
--

% endfor
