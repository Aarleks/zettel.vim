# Zettelkasten Functions

A neovim plugin to assist with management of a Zettelkasten. Lean and simple is the plugin philosophy.

**Questions**
* Should a zettelkasten be a git repo? Maybe... Certainly adds a potentially useful history of one's thinking about each note. Worth developing.
* Visualisation of note connections can be helpful; to what extent should these functions exist or be easily callable from within Vim?

## General

Declare a zettelkasten directory: currently `g:zettelkasten`

Currently `zettel.vim` only accepts a single zettelkasten directory. The Luhmanisch notion of a zettelkasten functions as a 'second brain' carries the implied notion that there is only one such external memory and elaboration network. While this seems somewhat arbitrary, the breaking up of a 'knowledge repository' by subject/domain seems in tension with the aspiration of interconnected thinking. At present, my argument remains for a single notes repository.

## Change `*.md` Files in Zettelkasten Directory to `zettel` Filetype

* Markdown files in a `g:zettelkasten` could be changed to 'zettel' filetype
* use pandoc-syntax highlighting
* filetype-specific keymappings?

## Make a Zettel - YAML style

* Open a new file in `g:zettelkasten` and take a string as the filename
* Read the zettel template into the new file
* Read the filename into the YAML `title:` line and make title case
* Place the cursor where the first line of the zettel will go and enter Insert mode

## Backlink List

* Search every zettel for `filename`
* populate the quickfix list with the results
* Open the quickfix list bottom right and narrow

## Preview Menu

* View a list of zettel filenames
* Preview the file (like `lf`)
* see Greg Hurrell's `corpus` program

## ZettelCare

* Open a floating window with links to, e.g.:
    * 5 most recently modified files
    * 5 least recently modified files
    * 3 random files
* Can navigate to files (`gf`?)
* Lists are refreshed every time the function is called
