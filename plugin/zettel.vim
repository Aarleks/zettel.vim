" For commands and leader combinations
" <Leader>zl = insert link markers and put the cursor inside <C-x><C-f>
" <Leader>z
" <Leader>z
" <Leader>z
" <Leader>z

autocmd BufWritePost g:zettelkasten
	    \ call zettel#makeTags()

" <Leader>zz = open zettelhome
nnoremap <Leader>zz :call zettel#zettelHome()<CR>

" <Leader>zm = make a new zettel
command! -nargs=* MakeZettel call zettel#makeZettel(<f-args>)
nnoremap <Leader>zm :MakeZettel

" <Leader>zf = find a zettel by filename using fzf.vim
"command! -bang FindZettel call fzf#vim#files(g:zettelkasten, <bang>0)
command! -nargs=* FindZettel call zettel#findZettel(<f-args>)

nnoremap <Leader>zf :FindZettel<CR>

" Search the file contents of the zettelkasten with ripgrep and fzf.vim
" Assumes the current working directory is the zettelkasten
command! -bang -nargs=* RG call fzf#vim#grep("rg --no-ignore-parent --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

nnoremap <Leader>zs :RG ''<CR>

" <Leader>zt = tag-search the zettelkasten using fzf.vim
nnoremap <Leader>zt :Tags<CR>

" Search for backlinks to the current Zettel and open the quickfix list with results
command! -nargs=0 BackLink :execute "grep -F '" . "[[" . expand("%:t") . "]]" .  "'" | :copen

nnoremap <leader>zb :BackLink<CR><CR>
