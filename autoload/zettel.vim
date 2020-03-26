" Build a Zettelkasten with Vim

" The global variable 'zettelkasten' must be set in the vimrc as a filepath to
" you Zettelkasten folder; e.g. let g:zettelkasten = '$HOME/Zettelkasten/'

function! zettel#makeZettel(...)
    " Make a unique filename
    let zettelname = g:zettelkasten . strftime("%F-%H%M") . "-" . join(a:000, '-') . '.md'
    execute "edit " . zettelname
endfunc


function! zettel#ZettelFile()
    execute "Files " . g:zettelkasten
endfunc

" If
