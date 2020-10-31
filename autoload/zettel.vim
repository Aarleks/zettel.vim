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
    execute "cd " . g:zettelkasten
    execute "edit " . g:zettelkasten . "home.md"
endfunction

" CREATE:
" Create a new zettel
function! zettel#makeZettel(...) abort
    " Make a unique filename
    let zettelname = g:zettelkasten . join(a:000, '-') . '.md'
    execute "edit " . zettelname
    execute "-1read " . g:zettelkasten . "template.md"
    execute "normal! 2GA"
endfunction


" SEARCH:

" Search for zettels by file name
function! zettel#findZettel() abort
    execute ":call fzf#vim#files(g:zettelkasten)"
endfunction

" Return compatible options to user's settings
let &cpo = s:save_cpo
unlet s:save_cpo
