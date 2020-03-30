" Build a Zettelkasten with Vim

" The global variable 'zettelkasten' must be set in the vimrc as a filepath to
" you Zettelkasten folder; e.g. let g:zettelkasten = '$HOME/Zettelkasten/'

" CREATE:
" Create a new zettel
function! zettel#makeZettel(...) abort
    " Make a unique filename
    let zettelname = g:zettelkasten . strftime("%Y-%m%d-%H%M") . "_" . join(a:000, '-') . '.md'
    execute "edit " . zettelname
endfunc

" Ctags
function! zettel#makeTags() abort
    execute "!ctags -R ."
    "execute "redraw!"
endfunc

" SEARCH:

" Search for zettels by file name
function! zettel#findZettel() abort
    execute ":Files " . g:zettelkasten
endfunc

