" For commands and leader combinations

" <Leader>zm = make a new zettel
" <Leader>zf = find a zettel by filename
" <Leader>zs = search the file contents of the zettelkasten with ripgrep
" <Leader>zt = tag-search the zettelkasten
" <Leader>zl = insert link markers and put the cursor inside <C-x><C-f>
" <Leader>z
" <Leader>z
" <Leader>z
" <Leader>z

command! -bang -nargs=* RG call fzf#vim#grep("rg --no-ignore-parent --column --line-number --no-heading --color=always --smart-case " . <q-args>, 1, <bang>0)

nnoremap <Leader>zs :RG ''<CR>
