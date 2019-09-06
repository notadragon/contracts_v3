<!DOCTYPE html>
<html>
<head>
    <title>Contracts 3.0 -- use cases</title>
    <style>

table, th, td{
  border: 1px solid black;
  padding: 5pt;
  border-spacing: 0;
  border-collapse: collapse;
}
    </style>
</head>
<body>

Editors: Ryan McDougall, Joshua Berne, Andrzej Krzemie&#324;ski, Timur Doumler

<h1>Contracts &mdash; use cases survey</h1>

<h2>Use cases &mdash; table</h2>

<table>
<tr><th>Code</th><th>As A</th><th>In Order To</th><th>I Want To</th><th>Priority</th></tr>

% for udict in parsed:
<tr><td>\
% if "description" in udict:
<a href="#${udict["label"]}">${udict["label"]}</a>\
% endif
</td>
  <td>${udict["asa"]}</td>
  <td>${udict["todo"]}</td>
  <td>${udict["want"]}</td>
  <td></td></tr>

% endfor
</table>

<h2>Use cases &mdash; descriptions</h2>

<table>

% for udict in parsed:
% if "label" in udict and "description" in udict:
<tr><td><a name="${udict["label"]}">${udict["label"]}</a></td>
    <td>${udict["description"]}\
</td></tr>

  % endif
% endfor
</table>

Rest is TBD...

</body>
</html>

