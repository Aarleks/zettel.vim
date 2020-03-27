" Build a Zettelkasten with Vim

" The global variable 'zettelkasten' must be set in the vimrc as a filepath to
" you Zettelkasten folder; e.g. let g:zettelkasten = '$HOME/Zettelkasten/'

" CREATE:
" Create a new zettel
function! zettel#makeZettel(...)
    " Make a unique filename
    let zettelname = g:zettelkasten . strftime("%F-%H%M") . "-" . join(a:000, '-') . '.md'
    execute "edit " . zettelname
endfunc

" SEARCH:

" Search for zettels by file name
command! -bang ZettelFiles call fzf#vim#files('~/Dropbox/Zettelkasten', <bang>0)

" If
