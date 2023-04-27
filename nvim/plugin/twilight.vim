if has('nvim')

lua << EOF
  require('twilight_config')
EOF

noremap <c-t> :Twilight<cr>

endif
