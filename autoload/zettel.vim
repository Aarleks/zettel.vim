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
    execute "edit " . g:zettelkasten
endfunction

" CREATE:
" Create a new zettel
function! zettel#makeZettel(...) abort
    " Make a unique filename
    let zettelname = g:zettelkasten . join(a:000, '-') . '.md'
    execute "edit " . zettelname
    execute "-1read " . g:zettelkasten . "/assets/template.md"
    " add in filename as title in the document
    execute "normal! 2GA"
endfunction

" SEARCH:

" Search for zettels by file name
function! zettel#findZettel() abort
    execute ":call fzf#vim#files(g:zettelkasten)"
endfunction

function! zettel#backlink()
  let current_file = expand("%:t:r")
  let filenamepattern = printf('/\[%s[|#\]]/', current_filename)
  let locations = []
  let backfiles = zettel#vimwiki#wikigrep(filenamepattern)
  for file in backfiles
    " only add backlink if it is not already backlink
    let is_backlink = s:is_in_backlinks(file, current_filename)
    if is_backlink < 1
      " Make sure we don't add ourselves
      if !(file ==# expand("%:p"))
        call s:add_bulleted_link(locations, file)
      endif
    endif
  endfor

  if empty(locations)
    echomsg 'Vimzettel: No other file links to this file'
  else
    call uniq(locations)
    " Insert back links section
    call s:insert_link_array(g:zettel_backlinks_title, locations)
  endif
endfunction

" Return compatible options to user's settings
let &cpo = s:save_cpo
unlet s:save_cpo
