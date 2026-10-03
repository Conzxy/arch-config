return {
    "mrcjkb/rustaceanvim",
    version = '^5',
    lazy = false,
    dependencies = {
        'nvim-treesitter/nvim-treesitter'
    },
    config = function ()
        local map = vim.keymap.set
        local opts = { silent = true, noremap = true, }

        vim.g.rustaceanvim = {
            tools = {
                float_win_config = {
                    auto_focus = true,
                }
            },
            server = {
                on_attach = function(client, bufnr)
                    map("n", "<leader>a", function() vim.cmd.RustLsp({'hover', 'actions'}) end, opts)
                    map('n', '<leader>c', function() vim.cmd.RustLsp('codeAction') end, opts)
                end,
                settings = {
                    ['rust-analyzer'] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                        inlayHints = { locationLinks = false },
                        diagnostics = {
                            enable = true,
                            experimental = {
                                enable = true,
                            },
                        },
                        cargo = { allFeatures = true },
                    }
                }
            }
        }
    end
}
