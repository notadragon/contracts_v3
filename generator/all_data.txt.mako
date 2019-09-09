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
#
# CATEGORIES
# general - The most abstract/conceptual features of contracts
# metadata - needs for specifying information ABOUT a contract condition
# control - needs related to controlling contract behavior
# location - needs related to where contract conditions can go
# syntax - needs related to general contract syntax
# contents - needs related to what can go into a contract condition
# violations - requirements for what happens on general contract violation

% for udict in all_data:
--${udict["label"]}
${udict["asa"]}
${udict["todo"]}
${udict["want"]}
% for key,data in udict.items():
% if key not in ["label","asa","todo","want","description","descriptionmd"]:
==${key}
${data}
%endif
%endfor
==description
% if "description" in udict and udict["description"]:
${udict["description"]}
% endif
--

% endfor
