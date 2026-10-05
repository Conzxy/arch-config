if has('nvim')
lua << EOF
require("dashboard").setup  {
  theme = 'doom', --  theme is doom and hyper default is hyper
  -- disable_move = false --  default is false disable move keymap for hyper
  -- shortcut_type = 'letter'  --  shorcut type 'letter' or 'number'
  -- change_to_vcs_root  = false -- default is false,for open file in hyper mru. it will change to the root of vcs
  config = {
    header = { 
      desc_hl = "String",
      desc = ""..
"_     _            _   _ _           "..
"| \\ | |          | | | (_)          "..
"|  \\| | ___  ___ | | | |_ _ __ ___  "..
"| . ` |/ _ \\/ _ \\| | | | | '_ ` _ \\ "..
"| |\\  |  __/ (_) \\ \\_/ / | | | | | |"..
"\\_| \\_/\\___|\\___/ \\___/|_|_| |_| |_|",
    },
    project = {  enable = true, limit = 8, label = '', action = 'Telescope find_files cwd=', },
  },
  --  config used for theme
  -- hide = {
  --   statusline    -- hide statusline default is true
  --   tabline       -- hide the tabline
  --   winbar        -- hide winbar
  -- },
  -- preview = {
  --   command       -- preview command
  --   file_path     -- preview file path
  --   file_height   -- preview file height
  --   file_width    -- preview file width
  -- },
}
vim.g.daskboard_default_executive = 'Telescope'
EOF
endif
