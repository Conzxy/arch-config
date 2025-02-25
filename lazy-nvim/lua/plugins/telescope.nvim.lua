return {
    "nvim-telescope/telescope.nvim", 
    lazy = true,
    opts = {
        extensions = {
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {
                    -- even more opts
            }

            -- pseudo code / specification for writing custom displays, like the one
            -- for "codeactions"
            -- specific_opts = {
            --   [kind] = {
            --     make_indexed = function(items) -> indexed_items, width,
            --     make_displayer = function(widths) -> displayer
            --     make_display = function(displayer) -> function(e)
            --     make_ordinal = function(e) -> string
            --   },
            --   -- for example to disable the custom builtin "codeactions" display
            --      do the following
            --   codeactions = false,
            -- }
            }
        }
    },
    dependencies = {
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function() 
        -- To get ui-select loaded and working with telescope, you need to call
        -- load_extension, somewhere after setup function:
        require("telescope").load_extension("ui-select")

        local map = vim.keymap.set
        local opts = { noremap = true, }

        map('n', '<m-g>', '<cmd>Telescope git_files<cr>', opts)
        map('n', '<m-m>', '<cmd>Telescope oldfiles<cr>', opts)
    end
}
