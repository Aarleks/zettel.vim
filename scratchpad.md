# Zettelkasten Functions

A neovim plugin to assist with management of a Zettelkasten. Lean and simple is the plugin philosophy.

**Questions**
* Should a zettelkasten be a git repo?
*

## General

* Declare a zettelkasten directory
    * currently `g:zettelkasten`
    * As the idea of a zettelkasten is that it functions as a 'second brain', with the implied notion that there is only one such external memory and elaboration network, at the moment `zettel.vim` only accepts one zettelkasten directory.

## Change `*.md` Files in Zettelkasten Directory to `zettel` Filetype

* Markdown files in a Zettelkasten are changed to 'zettel' filetype
* use pandoc-syntax highlighting
* filetype-specific keymappings?

## Go To Zettelhome

* Open new buffer
* Change directory to `g:zettelkasten`
* Open `zettelhome.md`

## Make a Zettel

* Open a new file in `g:zettelkasten` and take a string as the filename
* Read the zettel template into the new file
* Read the filename into the YAML `title:` line and make title case
* Place the cursor where the first line of the zettel will go and enter Insert mode

## Zettel Filename Search

* Use `fzf` to search zettel filenames
* Display filename and text

## Zettel Content Search

* Use `fzf` to search zettel file contet
* Display filename and relevant text

## Backlink Update

* if no backlink file exists (`/zettelkasten/assets/`) create one
* for each `*.md` file in zettelkasten:
    * grep for `[[*.md]]` saving only the matching text (i.e. the filename)
    * for each greped filename:
	* save filename:linkname in `backlink file`
* Invoke `Backlink Writer` to append backlinks below `## Backlinks` subheading in each `*.md` file in `g:zettelkasten`

## Backlink List

* Search `backlink file` for every `value` and get the `key`
* populate the quickfix list with the results
* Open the quickfix list bottom right and narrow

## Backlink Writer

* For each `*.md` file:
    * Search `backlink file` for its `value` pair
    * Make the list of `key:value` pairs unique
    * Append the `key` data below `## Backlinks` line in file

## Link List

* If current directory is `g:zettelkasten` (or better yet, filetype = zettel?)
    * search current buffer for `[[*.md]]`
    * print results to quickfix list
* Open quickfix list bottom right and narrow

## Preview Menu

* View a list of zettel filenames
* Preview the file (like `lf`)
* see Greg Hurrell's `corpus` program

## ZettelCare

* Open a floating window (see, e.g. whid.vim) with links to:
    * 5 most recently modified files
    * 5 least recently modified files
    * 3 random files
* Can navigate to files (`gf`?)
* Lists are refreshed every time the function is called
