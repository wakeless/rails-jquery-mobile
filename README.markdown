Rails for jQuery Mobile is a simple extension to the built in rails tag helpers which 
assists in the writing of jQuery Mobile sites. 

## Usage ##

There are 2 ways of accessing the helpers. Firstly there are a number of function which create the tags with different
data-roles. The helpers are:
* page
* navbar
* content
* footer
* header
* collapsible
* listview
* numberedlist


Secondly the helpers overwrites the builtin content_tag and tag functions and rewrites the related attributes to data-
attributes. The attributes which it rewrites are
* theme -> data-theme
* collapsed -> data-collapsed
* transistion -> data-transition
* direction -> data-direction
* ajax -> data-ajax
