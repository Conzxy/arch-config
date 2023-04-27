if has('nvim')

lua << EOF
  require('session_manager_config')   
EOF

  nnoremap <c-s> :SessionManager load_session<cr>

  map <leader>ls :SessionManager load_session<cr>
  map <leader>scs :SessionManager save_current_session<cr>
  map <leader>lcs :SessionManager load_current_dir_session<cr>
  map <leader>lls :SessionManager load_last_session<cr>
  map <leader>ds :SessionManager delete_session<cr>
endif
