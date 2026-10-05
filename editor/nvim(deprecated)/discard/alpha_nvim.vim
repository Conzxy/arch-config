if has('nvim')
lua << EOF
require('alpha').setup(require'alpha.themes.dashboard'.config)
EOF
endif
