" vim-preview config
noremap <m-;> :PreviewTag<cr>
noremap <m-u> :PreviewScroll -1<cr>
noremap <m-d> :PreviewScroll +1<cr>
" <c-\><c-o> leave insert mode but also allow press command
inoremap <m-u> <c-\><c-o>:PreviewScroll -1<cr>
inoremap <m-d> <c-\><c-o>:PreviewScroll +1<cr>
noremap <leader>gt :PreviewGoto edit<cr>
noremap <leader>lt :PreviewList<cr>

" qf = quickfix
autocmd FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
autocmd FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
