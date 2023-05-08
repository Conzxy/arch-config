if has('nvim')

lua << EOF
  require('telescope_config')
EOF

noremap <m-g> :Telescope git_files<cr>
noremap <m-m> :Telescope oldfiles<cr>
endif
