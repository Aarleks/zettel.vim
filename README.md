# Zettel.vim

A Zettelkasten plugin for Vim

A Zettelkasten should be a repository for knowledge and connections between items of knowledge. It should contain notes (zettel) that are made up of content, tags, references, and cross-references. It should also be possible to see which other notes point to a zettel.

## Content

In this plugin, zettels are `markdown` files. Write normally.

## Tags

Tags are represented by the ampersand character.

```
&tag &another_tag
```

The plugin uses [Ultimate CTags](aroist) to build a tag list. You can use the `Leader t` to call `:! ctags -R .`

For this to work, you'll need to create a folder `.ctags.d/` in your Zettelkasten folder. Copy the following in to read words that begin with ampersand into your tag stack:

```
--langdef=markdowntags
--languages=markdowntags
--langmap=markdowntags:.md
--kinddef-markdowntags=t,tag,tags
--mline-regex-markdowntags=/(^|[[:space:]])&(\w\S*)/\2/t/{mgroup=1}
```

## References

Rererences use the syntax @reference_name, as in `vim-pandoc-syntax`.

## Cross-References

In the main, cross-references should be to other zettels. In the spirit of keeping things simple the plugin uses Vim's `goto file` function; called with the `gf` key combination.

```
[cross-reference.md]
```

## Links

[https://github.com/Hipomenes/vim-ide](https://github.com/Hipomenes/vim-ide) - Vim as an "Integrated Research Environment"

[https://www.edwinwenink.xyz/posts/42-vim_notetaking/](https://www.edwinwenink.xyz/posts/42-vim_notetaking/) - Excellent zettelkasten in vanilla Vim

[https://vimways.org/2019/personal-notetaking-in-vim/](https://vimways.org/2019/personal-notetaking-in-vim/) - Another vanilla Vim Zettelkasten, this time rolled into a plugin of sorts


```
DONE - Make new zettel
DONE - Search for zettels by file names
DONE - Search in zettels by content using grep or ripgrep
DONE - Tag system: 1) make a tag, 2) search by tags
TODO - non-goyo focussed writing for Zettel buffers
TODO - note history system (jumplist)
TODO - like urlscan; list links outward pointing
TODO - list links inward pointing
TODO - syntax highlighting for tags, references, and zettelinks

```

## Make a new Zettel

Sam Wallage's [Vimwayt post](https://vimways.org/2019/personal-notetaking-in-vim/) on Zettelkasten has a bunch of useful little functions and scripts.

## Search for Zettel Files

Search the declared Zettelkasten using fzf


