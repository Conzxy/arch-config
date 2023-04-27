if has('nvim')

lua << EOF
  require('telescope_config')
EOF

map <leader>gf :Telescope git_files<cr>
endif
