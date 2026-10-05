if has('nvim')

lua << EOF
  require('zenmode_config')
EOF

noremap <m-z> :ZenMode<cr>

endif
