return {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons"
    },
    config = function()
        -- disable netrw at the very start of your init.lua (strongly advised)

        -- !!!
        -- For lazy.nvim, the lazy must be false, and 
        -- the `.opts` fields is not applied.
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                -- adaptive_size = false,
                width = 30,
                side = "left",
            },
            renderer = {
                group_empty = true,
            },
            filters = {
                dotfiles = true,
            },
        })
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true
        vim.api.nvim_create_autocmd('BufWinEnter', {
            pattern = '*',
            callback = function()
                if vim.bo.filetype == 'NvimTree' then
                    require'bufferline.api'.set_offset(31, 'FileTree')
                end
            end
        })

        vim.api.nvim_create_autocmd('BufWinLeave', {
            pattern = '*',
            callback = function()
                if vim.fn.expand('<afile>'):match('NvimTree') then
                require'bufferline.api'.set_offset(0)
                end
            end
        })

        vim.keymap.set('n', '<leader>nt', '<cmd>NvimTreeToggle<cr>', { noremap = true })
    end
}
