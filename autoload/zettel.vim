" Build a Zettelkasten with Vim

" The global variable 'zettelkasten' must be set in the vimrc as a filepath to
" you Zettelkasten folder; e.g. let g:zettelkasten = '$HOME/Zettelkasten/'

" Set compatible options to defaults
let s:save_cpo = &cpo
set cpo&vim


" HOME:
" Open the zettelkasten home page and read in the first lines of the
" zettel-of-the-day
function! zettel#zettelHome() abort
    execute "edit " . g:zettelkasten . "home.md"
    execute "Goyo"
endfunction

" CREATE:
" Create a new zettel
function! zettel#makeZettel(...) abort
    " Make a unique filename
    let zettelname = g:zettelkasten . strftime("%Y-%m%d-%H%M") . "_" . join(a:000, '-') . '.md'
    execute "edit " . zettelname
endfunction

" Ctags
function! zettel#makeTags() abort
    execute "silent !ctags -R" . g:zettelkasten
    "execute "redraw!"
endfunction

" SEARCH:

" Search for zettels by file name
function! zettel#findZettel() abort
    execute ":Files " . g:zettelkasten
endfunction

" Return compatible options to user's settings
let &cpo = s:save_cpo
unlet s:save_cpo
