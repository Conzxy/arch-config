if has('nvim')
lua << EOF
local opts = {
  log_level = 'info',
  -- If cwd has no session, load the last session
  auto_session_enable_last_session = true,
  -- store the sessions
  auto_session_root_dir = vim.fn.stdpath('data').."/sessions/",
  -- restore and save
  auto_session_enabled = true,
  -- auto_save_enabled = nil,
  -- auto_restore_enabled = nil,
  auto_session_suppress_dirs = nil,
  auto_session_use_git_branch = false,
  -- the configs below are lua only

  session_lens = {
    theme_conf = { border = true },
    previewer = false,
  },
}

require('auto-session').setup(opts)

-- Set mapping for searching a session.
vim.keymap.set("n", "<C-s>", require("auto-session.session-lens").search_session, {
  noremap = true,
})

EOF

endif
