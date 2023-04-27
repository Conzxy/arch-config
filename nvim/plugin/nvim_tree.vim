if has('nvim')

lua << EOF
  require('nvim_tree_config')
EOF

map <leader>nt :NvimTreeToggle<cr>

endif
