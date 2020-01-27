<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="generator" content="pandoc">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
  <title>D2032R0 &mdash; Contract Use Cases</title>
  <style type="text/css">code{white-space: pre;}</style>
  <style type="text/css">
a.sourceLine { display: inline-block; line-height: 1.25; }
a.sourceLine { pointer-events: none; color: inherit; text-decoration: inherit; }
a.sourceLine:empty { height: 1.2em; }
.sourceCode { overflow: visible; }
code.sourceCode { white-space: pre; position: relative; }
div.sourceCode { margin: 1em 0; }
pre.sourceCode { margin: 0; }
@media screen {
div.sourceCode { overflow: auto; }
}
@media print {
code.sourceCode { white-space: pre-wrap; }
a.sourceLine { text-indent: -1em; padding-left: 1em; }
}
pre.numberSource a.sourceLine
  { position: relative; left: -4em; }
pre.numberSource a.sourceLine::before
  { content: attr(title);
    position: relative; left: -1em; text-align: right; vertical-align: baseline;
    border: none; pointer-events: all; display: inline-block;
    -webkit-touch-callout: none; -webkit-user-select: none;
    -khtml-user-select: none; -moz-user-select: none;
    -ms-user-select: none; user-select: none;
    padding: 0 4px; width: 4em;
    color: #aaaaaa;
  }
pre.numberSource { margin-left: 3em; border-left: 1px solid #aaaaaa;  padding-left: 4px; }
div.sourceCode
  {  }
@media screen {
a.sourceLine::before { text-decoration: underline; }
}
code span.al { color: #ff0000; font-weight: bold; } /* Alert */
code span.an { color: #60a0b0; font-weight: bold; font-style: italic; } /* Annotation */
code span.at { color: #7d9029; } /* Attribute */
code span.bn { color: #40a070; } /* BaseN */
code span.bu { } /* BuiltIn */
code span.cf { color: #007020; font-weight: bold; } /* ControlFlow */
code span.ch { color: #4070a0; } /* Char */
code span.cn { color: #880000; } /* Constant */
code span.co { color: #60a0b0; font-style: italic; } /* Comment */
code span.cv { color: #60a0b0; font-weight: bold; font-style: italic; } /* CommentVar */
code span.do { color: #ba2121; font-style: italic; } /* Documentation */
code span.dt { color: #902000; } /* DataType */
code span.dv { color: #40a070; } /* DecVal */
code span.er { color: #ff0000; font-weight: bold; } /* Error */
code span.ex { } /* Extension */
code span.fl { color: #40a070; } /* Float */
code span.fu { color: #06287e; } /* Function */
code span.im { } /* Import */
code span.in { color: #60a0b0; font-weight: bold; font-style: italic; } /* Information */
code span.kw { color: #007020; font-weight: bold; } /* Keyword */
code span.op { color: #666666; } /* Operator */
code span.ot { color: #007020; } /* Other */
code span.pp { color: #bc7a00; } /* Preprocessor */
code span.sc { color: #4070a0; } /* SpecialChar */
code span.ss { color: #bb6688; } /* SpecialString */
code span.st { color: #4070a0; } /* String */
code span.va { color: #19177c; } /* Variable */
code span.vs { color: #4070a0; } /* VerbatimString */
code span.wa { color: #60a0b0; font-weight: bold; font-style: italic; } /* Warning */
  </style>
  <link rel="stylesheet" href="github.css">
  <!-- Style for Markdown -->
  <style>
  .md2html-container {
    max-width: 800px;
    margin: 0 auto;
  }
  .md2html-container > h1:first-child {
    margin-top: 0;
  }
  body {
  font-family: Helvetica, arial, sans-serif;
  font-size: 14px;
  line-height: 1.6;
  padding-top: 10px;
  padding-bottom: 10px;
  background-color: white;
  padding: 30px; }

body > *:first-child {
  margin-top: 0 !important; }
body > *:last-child {
  margin-bottom: 0 !important; }

a {
  color: #4183C4; }
a.absent {
  color: #cc0000; }
a.anchor {
  display: block;
  padding-left: 30px;
  margin-left: -30px;
  cursor: pointer;
  position: absolute;
  top: 0;
  left: 0;
  bottom: 0; }

h1, h2, h3, h4, h5, h6 {
  margin: 20px 0 10px;
  padding: 0;
  font-weight: bold;
  -webkit-font-smoothing: antialiased;
  cursor: text;
  position: relative; }

h1:hover a.anchor, h2:hover a.anchor, h3:hover a.anchor, h4:hover a.anchor, h5:hover a.anchor, h6:hover a.anchor {
  background: url("../../images/modules/styleguide/para.png") no-repeat 10px center;
  text-decoration: none; }

h1 tt, h1 code {
  font-size: inherit; }

h2 tt, h2 code {
  font-size: inherit; }

h3 tt, h3 code {
  font-size: inherit; }

h4 tt, h4 code {
  font-size: inherit; }

h5 tt, h5 code {
  font-size: inherit; }

h6 tt, h6 code {
  font-size: inherit; }

h1 {
  font-size: 28px;
  color: black; }

h2 {
  font-size: 24px;
  border-bottom: 1px solid #cccccc;
  color: black; }

h3 {
  font-size: 18px; }

h4 {
  font-size: 16px; }

h5 {
  font-size: 14px; }

h6 {
  color: #777777;
  font-size: 14px; }

p, blockquote, ul, ol, dl, li, table, pre {
  margin: 15px 0; }

hr {
  background: transparent url("../../images/modules/pulls/dirty-shade.png") repeat-x 0 0;
  border: 0 none;
  color: #cccccc;
  height: 4px;
  padding: 0; }

body > h2:first-child {
  margin-top: 0;
  padding-top: 0; }
body > h1:first-child {
  margin-top: 0;
  padding-top: 0; }
  body > h1:first-child + h2 {
    margin-top: 0;
    padding-top: 0; }
body > h3:first-child, body > h4:first-child, body > h5:first-child, body > h6:first-child {
  margin-top: 0;
  padding-top: 0; }

a:first-child h1, a:first-child h2, a:first-child h3, a:first-child h4, a:first-child h5, a:first-child h6 {
  margin-top: 0;
  padding-top: 0; }

h1 p, h2 p, h3 p, h4 p, h5 p, h6 p {
  margin-top: 0; }

li p.first {
  display: inline-block; }

ul, ol {
  padding-left: 30px; }

ul :first-child, ol :first-child {
  margin-top: 0; }

ul :last-child, ol :last-child {
  margin-bottom: 0; }

dl {
  padding: 0; }
  dl dt {
    font-size: 14px;
    font-weight: bold;
    font-style: italic;
    padding: 0;
    margin: 15px 0 5px; }
    dl dt:first-child {
      padding: 0; }
    dl dt > :first-child {
      margin-top: 0; }
    dl dt > :last-child {
      margin-bottom: 0; }
  dl dd {
    margin: 0 0 15px;
    padding: 0 15px; }
    dl dd > :first-child {
      margin-top: 0; }
    dl dd > :last-child {
      margin-bottom: 0; }

blockquote {
  border-left: 4px solid #dddddd;
  padding: 0 15px;
  color: #777777; }
  blockquote > :first-child {
    margin-top: 0; }
  blockquote > :last-child {
    margin-bottom: 0; }

table {
  border-collapse: collapse;
  padding: 0; }
  table tr {
    border-top: 1px solid #cccccc;
    background-color: white;
    margin: 0;
    padding: 0; }
    table tr:nth-child(2n) {
      background-color: #f8f8f8; }
    table tr th {
      font-weight: bold;
      border: 1px solid #cccccc;
      text-align: left;
      margin: 0;
      padding: 6px 13px; }
    table tr td {
      border: 1px solid #cccccc;
      text-align: left;
      margin: 0;
      padding: 6px 13px; }
    table tr th :first-child, table tr td :first-child {
      margin-top: 0; }
    table tr th :last-child, table tr td :last-child {
      margin-bottom: 0; }

img {
  max-width: 100%; }

span.frame {
  display: block;
  overflow: hidden; }
  span.frame > span {
    border: 1px solid #dddddd;
    display: block;
    float: left;
    overflow: hidden;
    margin: 13px 0 0;
    padding: 7px;
    width: auto; }
  span.frame span img {
    display: block;
    float: left; }
  span.frame span span {
    clear: both;
    color: #333333;
    display: block;
    padding: 5px 0 0; }
span.align-center {
  display: block;
  overflow: hidden;
  clear: both; }
  span.align-center > span {
    display: block;
    overflow: hidden;
    margin: 13px auto 0;
    text-align: center; }
  span.align-center span img {
    margin: 0 auto;
    text-align: center; }
span.align-right {
  display: block;
  overflow: hidden;
  clear: both; }
  span.align-right > span {
    display: block;
    overflow: hidden;
    margin: 13px 0 0;
    text-align: right; }
  span.align-right span img {
    margin: 0;
    text-align: right; }
span.float-left {
  display: block;
  margin-right: 13px;
  overflow: hidden;
  float: left; }
  span.float-left span {
    margin: 13px 0 0; }
span.float-right {
  display: block;
  margin-left: 13px;
  overflow: hidden;
  float: right; }
  span.float-right > span {
    display: block;
    overflow: hidden;
    margin: 13px auto 0;
    text-align: right; }

code, tt {
  margin: 0 2px;
  padding: 0 5px;
  white-space: nowrap;
  border: 1px solid #eaeaea;
  background-color: #f8f8f8;
  border-radius: 3px; }

pre code {
  margin: 0;
  padding: 0;
  white-space: pre;
  border: none;
  background: transparent; }

.highlight pre {
  background-color: #f8f8f8;
  border: 1px solid #cccccc;
  font-size: 13px;
  line-height: 19px;
  overflow: auto;
  padding: 6px 10px;
  border-radius: 3px; }

pre {
  background-color: #f8f8f8;
  border: 1px solid #cccccc;
  font-size: 13px;
  line-height: 19px;
  overflow: auto;
  padding: 6px 10px;
  border-radius: 3px; }
  pre code, pre tt {
    background-color: transparent;
    border: none; }
  </style>
  <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv-printshiv.min.js"></script>
  <![endif]-->
</head>
<body>

<%block filter="formatmarkdown">
Document no: D2032R0 <br/>
Date: 2019-11-22 <br/>
Authors:
Joshua Berne
<br/>
Reply-to: jberne4@bloomberg.net <br/>
Audience: SG21


Contracts &mdash; What Came Before
==================================

Introduction
------------

Prior to the formation of SG21 there were a number of different potential
solutions proposed for contract based programming in the language.   With the
formation of SG21, a large number of use cases that any future contract
solution might need to satisfy have been presented and polled on (see
[P1995](http://wg21.link/P1995R0) for the use cases and the initial poll results).

In order to better understand these use cases, a number of people expressed
questions about how those use cases might be met with standard C++20 with no
language based contracts, and how each of the prior language proposals might
satisfy these use cases.  We hope this exposition helps in understanding the
use cases better, and helps to leverage the work that has gone before into
determining our future direction for language based contracts.

Methodology
-----------

There are 4 primary language variations that we wish to evaluate for their
merits at satisfying the SG21 use cases:

* N4842 - the current C++ working draft - is the closest appropximation
  currently available of what wil be the C++20 standard, and
  is (barring something incredibly surprising happening) going to ship with no
  explicit contract checking facilities in the language or standard library
  itself.  Many groups around the world have implemented contract checking
  libraries themselves (and come to the committee to attempt to build on those
  experiences to get those features into the language) and those libraries are
  still just as usable for contract checking in C++ today as they have always
  been.  We will reference the BDE libraries (https://github.com/Bloomberg/bde/,
  specifically bsls_assert and bsls_review, which can be found in
  https://github.com/bloomberg/bde/tree/master/groups/bsl/bsls)
  for examples of what can be done with no new language support.
* N4820 - The C++ draft prior to the Summer 2019 WG21 meeting in Cologne - was
  the last draft that had the initially accepted contract checking facility.
  As with all of the other facilities we will discuss here, this proposal allowed
  for annotating contracts as boolean predicates within an attribute-like syntax
  that could be attached to functions as preconditions or postconditions, and
  put inside functions as assertions.   Three basic contract levels were
  allowed - `default`, `audit`, and `axiom` - with all levels either checked at
  runtime or introducing undefined behavior if not checked and violated.
* P1429 - This paper primarily focuses on redefining the contract behavior of
  N4820 in terms of named semantics, and allowing for setting of the various
  contract levels (`default`, `audit`, and `axiom`) to specific behaviors (in lieu of
  the combination of build level and continuation mode available in N4820).
* P1607 - This paper proposed removing the contract levels entirely and _only_
  allowing the setting of specific semantics, with the intent to provide more
  general build time control using macros until consensus could be reached on
  how that control should be presented.   This option, with no build levels
  and just four literal semantics, reached consensus in EWG on July 15th 2019,
  prior to the removal of contracts entirely from the draft.
  
Rather than enumerate all possible variations that could be chosen, we will
focus on comparing P1429 with no literal semantics and P1607 with no contract
levels.

For each of these variations, we will assign a value in the range 0-100 for
each use case with roughly the following meanings:

* 0 - Explicilty prohibitted or fundamnetally impossible.
* 25 - Feasible with great extra effort or in a highly limitted fashion, no
  useful support for this use case.
* 50 - Limitted support, with possible caveats that would prevent real
  satisfaction of this use case.
* 75 - Supported sufficiently to be used in a realistic situation.
* 100 - Fully supported with no major caveats.

The goal of these numbers is to give a rough feeling for worth.  In the future,
we expect to see use cases given some weight (based partly on importance to the
community and partly on distinctness from other use cases), and then combined
with these numbers to give each solution a total value that can be used to
understand how effecitvely is satisfies the needs of the community.

Note that the long term goal here is not to give a number to say "you must vote
for this since it has a higher number" but rather to provide a value that
can be used to see "this solution measurably improves support for use cases that 
I personally might not consider important but that others do see as a
priority".

Use Cases
---------

</%block>

<table>
  <tr>
    <th>#</th>
    <th colspan="2">Code</th><th>As A</th><th>In Order To</th><th>I Want To</th>
  <th>N4842<br/>C++20</th>
  <th>N4820<br/>Pre-Cologne Draft</th>
  <th>P1429<br/>Semantic Level Control</th>
  <th>P1607<br/>Literal Semantics</th>
  </tr>

<%  
  displaydata = []
  keyindices = {}

  for udict in all_data:
      if "x2032.see" in udict:
          if "x2032.details" in udict:
              raise Exception("Both 'see' and 'details' in %s" % (udict,))
          l = udict["x2032.see"]
      elif "x2032.details" in udict:
          l = udict["label"]
      else:
          raise Exception("No 'see' or 'details' in %s" % (udict,))
      if l in keyindices:
          dd = keyindices[l]
      else:
          dd = [ l, "", list([]) ]
          displaydata.append(dd)
          keyindices[l] = dd
          
      if "x2032.details" in udict:
          dd[1] = udict["x2032.details"]
      dd[2].append(udict)

%>
  
<%
  n = 1
  papers = [ "N4842", "N4820", "P1429", "P1607" ]
  ptotals = { k : 0 for k in papers + ["all"] }
  pweightedtotals = { k : 0 for k in papers + ["all"]}
  pweightedtotals2 = { k : 0 for k in papers + ["all"]}
  %>
% for dd in displaydata:
% for udict in dd[2]:
  <tr>
  <td>${n}</td>
    <td colspan="2">\
<a href="#${udict["label"]}">${udict["label"]}</a>\
  </td>
  <td>${udict["asa"]}</td>
  <td>${udict["todo"]}</td>
  <td>${udict["want"]}</td>
<%
  pweight = (len(udict["responses:3"])*2 + len(udict["responses:2"])) / (len(udict["responses:3"]) + len(udict["responses:2"]) + len(udict["responses:1"]))
  pweight2 = pweight if pweight >= 1.0 else 0.0
  ptotals["all"] = ptotals["all"] + 100
  pweightedtotals["all"] = pweightedtotals["all"] + (pweight * 100)
  pweightedtotals2["all"] = pweightedtotals2["all"] + (pweight2 * 100)
  %>
%  for p in papers:
<%
  pkey = "x2032.%s" % (p,)
  pval = int(udict[pkey])
  ptotals[p] = ptotals[p] + pval
  pweightedtotals[p] = pweightedtotals[p] + (pweight * pval)  
  pweightedtotals2[p] = pweightedtotals2[p] + (pweight2 * pval)  
  %>
  <td>${pval}</td>
% endfor
</tr>
<% n = n + 1 %>
%endfor

<tr>
  <td colspan="10"> ${formatmarkdown(dd[1])} </td>
</tr>

% endfor

</table>

<br/>

<%block filter="formatmarkdown">

Conclusion
----------

This is a lot of information to digest, so it might help to be able to get
some overview numbers on how the different proposals relate to one another.
There are endless ways to do this, and we make no attempt to be complete in
this analysis, but we will present some approaches that might be
useful.

* Simply adding up what percentage of the total value each proposal satisfies
produces the following results:

|  Proposal   |  Score   |
| ----------- | -------- |
% for p in papers:
| ${p} | ${"%0.3f" % (ptotals[p] * 100.0 / ptotals["all"],)}% |
%endfor

* An alternative is to integrate the results of the initial polls that were
reported in [P1995R0](http://wg21.link/P1995R0), using those to weight
the scores provided above (i.e., the values in the "Score" column in that
paper):

|  Proposal   |  Score   |
| ----------- | -------- |
% for p in papers:
| ${p} | ${"%0.3f" % (pweightedtotals[p] * 100.0 / pweightedtotals["all"],)}% |
%endfor

* Similarly, we could instead only consider the scores for use cases that had a
score in P1995R0 above a certain threshhold, such as everything with a score over
1.0:

|  Proposal   |  Score   |
| ----------- | -------- |
% for p in papers:
| ${p} | ${"%0.3f" % (pweightedtotals2[p] * 100.0 / pweightedtotals2["all"],)}% |
%endfor


Note that these are not intended to produce a complete measure of those proposals,
but simply as an example of how they might be compared.   These totals are not
a good measure of which proposal is intrinsicly better, but the changes to these
totals from any individual proposal should be considered relevant when trying
to understand how all users might benefit from any perticular change.

</%block>

</body>
</html>

