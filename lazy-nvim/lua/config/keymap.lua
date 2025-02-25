local map = vim.keymap.set
local opts = { silent = true, noremap = true }
local remap_opt = { noremap = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

map('n', '<cr>', 'o<esc>', remap_opt)
map('n', '<m-s>', 'i<space><esc>', remap_opt)
map('n', 'k', 'gkzz', remap_opt)
map('n', 'gk', 'kzz', remap_opt)
map('n', 'j', 'gjzz', remap_opt)
map('n', 'gj', 'jzz', remap_opt)

map('n', '<leader>Y', '"*y', remap_opt)
map('n', '<leader>P', '"*p', remap_opt)
map('n', '<leader>y', '"+y', remap_opt)
map('n', '<leader>p', '"+p', remap_opt)

map('n', '<m-;>', '<CMD>call CocActionAsync("jumpDefinition", "sp")<cr>', remap_opt)