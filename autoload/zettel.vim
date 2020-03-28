" Build a Zettelkasten with Vim

" The global variable 'zettelkasten' must be set in the vimrc as a filepath to
" you Zettelkasten folder; e.g. let g:zettelkasten = '$HOME/Zettelkasten/'

" CREATE:
" Create a new zettel
function! zettel#makeZettel(...)
    " Make a unique filename
    let zettelname = g:zettelkasten . strftime("%Y-%m%d-%H%M") . "_" . join(a:000, '-') . '.md'
    execute "edit " . zettelname
endfunc

" Create a new zettel from visual selection
" put zettel link markers around the text
" create a file in g:zettelkasten with strftime(%Y-%m%d-%H%M)

" SEARCH:

" Search for zettels by file name
function! zettel#findZettel()
    execute ":Files " . g:zettelkasten
endfunc
" If
