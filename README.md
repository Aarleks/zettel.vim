# Zettel.vim

A Zettelkasten plugin for Vim

A Zettelkasten is a repository of notes that elaborate a single point/thought. It should contain notes (zettel) that are made up of content, tags, references, and links to other notes. It should also be possible to see which other notes point back to a zettel. The idea is to create a network of notes of one's understandings of the world and the way those understandings interconnect.

Following Luhmann, Ahrens, and Matuschak, this plugin adheres to the notion of a lean but low-friction note creation and editing process. There are few functions and a flat file structure, the text is plain, and the template minimal and customisable.

## Content

In this plugin, zettels are `markdown` files. Write normally.

## Tags

Tags are represented by the hashtag/pound sign `#` in YAML header data.

```

tags: #tag #another_tag

```

The plugin uses [Ultimate CTags](aroist) to build a tag list.

For this to work, you'll need to create a folder `.ctags.d/` in your Zettelkasten folder. Copy the following in to read words that begin with hashtag into your tag stack:

```
--langdef=markdowntags
--languages=markdowntags
--langmap=markdowntags:.md
--kinddef-markdowntags=t,tag,tags
--mline-regex-markdowntags=/(^|[[:space:]])#(\w\S*)/\2/t/{mgroup=1}
```

## References

Rererences use the syntax @citekey, as in `vim-pandoc-syntax`.

## Zettel Links and Backlinks

Links are connections to other notes in the form of `[[local-filename.md]]`. In the spirit of keeping things simple this plugin assumes you will use Vim's `goto file` function; called with the `gf` key combination in normal mode.

**NOTE** - this syntax is under review and may be changed to normal markdown links with a function to remove hyphens and conceal the filename for the sake of readability.

## How to Install

I use vim-Plug:

```
Plug 'aarleks/zettel.vim'
```

From there you need to create a global variable in your init.vim/vimrc pointing to your notes folder/zettelkasten (the final forward slash is important):

```
let g:zettelkasten = 'path/to/your/notes/folder/'
```

## How to Use

In your notes folder, create a file called `home.md`. This file serves as your `zettelhome` - a landing page for when you want to start thinking inside your notes folder. Populate this file with whatever is helpful for you, perhaps an index of basic rules of use that you develop.

Next, create a basic template markdown file, called `template.md` for new notes. This could be as simple as:

```
# <title>

## Zettel Links

## References

## Backlinks
```

From here, new notes can be created with `<Leader>zm`. You will be asked to type a name for the file. Here is an example:

```
:MakeZettel notes should have simple descriptive filenames
```

This will create a file called `notes-should-have-simple-descriptive-filenames.md`, and will read `template.md` into it and put you at the end of the second line.

Type your note | develop knowledge | gain understanding and insight.

### Find Notes

* `<Leader>zf` - Search by filename using `ripgrep`.
* `<Leader>zs` - Search within all files in `g:zettelkasten` using riggrep.

## Read More

[https://github.com/Hipomenes/vim-ide](https://github.com/Hipomenes/vim-ide) - Vim as an "Integrated Research Environment"

[https://www.edwinwenink.xyz/posts/42-vim_notetaking/](https://www.edwinwenink.xyz/posts/42-vim_notetaking/) - Excellent zettelkasten in vanilla Vim

[https://vimways.org/2019/personal-notetaking-in-vim/](https://vimways.org/2019/personal-notetaking-in-vim/) - Another vanilla Vim Zettelkasten, this time rolled into a plugin of sorts

Sam Wallage's [Vimwayt post](https://vimways.org/2019/personal-notetaking-in-vim/) on Zettelkasten has a bunch of useful little functions and scripts.

```
TODO - note history system (jumplist)
TODO - update notes with backlinks from other notes

```

