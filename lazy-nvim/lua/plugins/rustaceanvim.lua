return {
    "mrcjkb/rustaceanvim",
    version = '^5',
    lazy = false,
    config = function ()
        local map = vim.keymap.set
        local opts = { silent = true, noremap = true, }
        map("n", "<leader>a", function() vim.cmd.RustLsp({'hover', 'actions'}) end, opts)
        map('n', '<leader>c', function() vim.cmd.RustLsp('codeAction') end, opts)
    end
}