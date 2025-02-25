local o = vim.o
local opt = vim.opt

-- o.ft = c.doxygen
o.foldenable = true
opt.backspace = { 'indent', 'eol', 'start' }
o.ignorecase = true
o.hlsearch = true
o.autowrite = true
o.hidden = true
o.mouse = a
o.autochdir = true

o.number = true
o.relativenumber = true
o.smartindent = true
o.cursorline = true
o.ruler = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true