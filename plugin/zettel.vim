" For commands and leader combinations

" open zettelhome
nnoremap <Leader>zz :call zettel#zettelHome()<CR>

" make a new zettel
command! -nargs=* MakeZettel call zettel#makeZettel(<f-args>)
nnoremap <Leader>zm :MakeZettel

" Find a zettel by filename using fzf.vim
command! -nargs=* FindZettel call zettel#findZettel(<f-args>)
nnoremap <Leader>zf :FindZettel<CR>

" Search the file contents of the zettelkasten with ripgrep and fzf.vim
" Assumes the current working directory is the zettelkasten
command! -bang -nargs=* RG call fzf#vim#grep("rg --no-ignore-parent --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

nnoremap <Leader>zs :RG ''<CR>

