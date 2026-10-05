return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- rustaceanvim manage the Rust lsp, the cmp also receive it
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",

        -- vsnip dependencies
        -- "hrsh7th/cmp-vsnip",
        -- "hrsh7th/vim-vsnip",

        -- Lua Snippet engine
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",

        -- "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "onsails/lspkind-nvim",
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')
        local select_next_cb = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end

        local select_prev_cb = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end

        local comfirm_cb = function(fallback) 
            if cmp.visible() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }) -- Don't select first item when no item is selected
            else
                fallback()
            end
        end

        local kDocStep = 10

        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            window = {
            },
            mapping = cmp.mapping.preset.insert({
                -- the mapping adaptor return a callback
                ['<M-b>'] = cmp.mapping.scroll_docs(-kDocStep),
                ['<M-f>'] = cmp.mapping.scroll_docs(kDocStep),
                ['<M-e>'] = cmp.mapping.abort(),
                ['<CR>'] = comfirm_cb,
                ['<Tab>'] = select_next_cb,
                ['<S-Tab>'] = select_prev_cb,
                ['<M-j>'] = select_next_cb,
                ['<M-k>'] = select_prev_cb,
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            }),
            formatting = {
                format = lspkind.cmp_format({
                    with_text = true, -- do not show text alongside icons
                    maxwidth = 50,    -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                    before = function(entry, vim_item)
                      -- Source 显示提示来源
                      vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                      return vim_item
                    end
                })
            },
        })

        require('luasnip.loaders.from_vscode').lazy_load()
    end
}
