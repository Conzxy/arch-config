return {
    { "MunifTanjim/nui.nvim", lazy = true },
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "liuchengxu/vista.vim", lazy = true },
    { 'neoclide/coc.nvim', lazy = true },
    -- Don't use the gruvbox neovim, the vim-airline will be imcompatible color,
    -- therefore, use vim native gruvbox here.
    { 'morhetz/gruvbox', lazy = false, priority = 1000, config = function()
        vim.o.background = "dark"
        vim.cmd.colorscheme("gruvbox")
    end},
    "kana/vim-altr",
    "skywind3000/vim-terminal-help",
    "jiangmiao/auto-pairs",
    "tpope/vim-endwise",
    "tpope/vim-commentary",
    "tpope/vim-fugitive",
    "Yggdroot/indentLine",
    "mhinz/vim-startify",
    'kien/rainbow_parentheses.vim',
    'junegunn/vim-easy-align',
    'vim-scripts/DoxygenToolkit.vim',
    'vim-airline/vim-airline',
}