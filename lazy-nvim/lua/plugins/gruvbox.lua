return {
    'ellisonleao/gruvbox.nvim',
    lazy = false, priority = 1000,
    -- opts do nothing
    config = function()
        require("gruvbox").setup({
            terminal_colors = true,
            undercurl = true,
            underline = true,
            blod = false,
            italic = {
                strings = false,
                emphasis = false,
                comments = true,
                operators = false,
                folds = false,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true,
            contrast = "hxxard",
            dim_inactive = false,
            transparent_mode = true,
        })
        vim.o.background = "dark"
        vim.cmd.colorscheme("gruvbox")
    end,

}
