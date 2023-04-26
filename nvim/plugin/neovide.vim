if has('nvim')
lua << EOF
  local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
  if vim.g.neovide then
    vim.o.guifont = "Iosevka Nerd font:h16:#h-none"
    vim.g.neovide_cursor_vfx_mode = "sonicboom"
    vim.g.neovide_cursor_vfx_particle_density = 10.0
    vim.g.neovide_cursor_vfx_particle_speed = 10.0
    -- vim.g.neovide_cursor_animation_length = 0.1
    -- vim.g.neovide_cursor_trail_size = 0.8
    vim.g.neovide_cursor_antialiasing = true
    -- for railgun only
    vim.g.neovide_cursor_vfx_particle_phase = 1.5
    -- for railgun only
    vim.g.neovide_cursor_vfx_particle_curl = 1.0

    vim.g.neovide_transparency = 0.8
    -- no effect
    vim.g.transparency = 0.4
    vim.g.neovide_background_color = "#0f1117" .. alpha()
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_no_idle = false
    vim.g.neovide_cofirm_quit = true
    vim.g.neovide_fullscreen = false
    vim.g.neovide_remeber_window_size = false
    vim.g.neovide_cursor_animate_command_line = true
  end
EOF
endif
