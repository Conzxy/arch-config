return {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    priority = 999,
    dependencies = {
        ' nvim-tree/nvim-web-devicons',
    },
    config = function()
        local lualine = require('lualine')

        local colors = {
            yellow = '#ecbe7b',
            green = '#98be65',
            blue = '#51afef',
            red = '#ec5f67',
            magenta = '#c678dd',
            violet = '#a9a1e1',
            orange = '#ff8800',
            darkblue = '#081633',
            cyan = '#008080',
        }

        local mode_component = {
            'mode',
            right_padding = 2,

            color = function()
                local mode_color = {
                    n = colors.red,
                    i = colors.green,
                    v = colors.blue,
                    [''] = colors.blue,
                    V = colors.blue,
                    c = colors.magenta,
                    no = colors.red,
                    s = colors.orange,
                    S = colors.orange,
                    [''] = colors.orange,
                    ic = colors.yellow,
                    R = colors.violet,
                    Rv = colors.violet,
                    cv = colors.red,
                    ce = colors.red,
                    r = colors.cyan,
                    rm = colors.cyan,
                    ['r?'] = colors.cyan,
                    ['!'] = colors.red,
                    t = colors.red,
                }
                return { fg = mode_color[vim.fn.mode()] }
            end
        }

        local diagnostics_component = {
            'diagnostics',
            sources = { 'nvim_lsp' },
            sections = { 'error', 'warn', 'info' },
            symbols = { error = ' ', warn = '  ', info = '  ' },
            diagnostics_color = {
              error = { fg = colors.red },
              warn = { fg = colors.yellow },
              info = { fg = colors.green },
            },
        }

        local lsp_component = {
            -- Lsp server name .
            function()
              local msg = 'X'
              local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
              local clients = vim.lsp.get_clients()
              if next(clients) == nil then
                return msg
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
              return msg
            end,
            icon = ' Lsp:',
            color = { fg = '#ffffff', gui = 'bold' },
        }


        local active_left_sections = { 
            mode_component,
            'branch',
            'filename' 
        }

        local active_right_sections = {
            diagnostics_component,
            lsp_component,
            'encoding',
            'filetype',
            'sectioncount',
            'localtion',
            'progress',
        }

        local config = {
            options = {
                icon_enabled = true,
                theme = 'gruvbox_dark',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 100,
                    tabline = 100,
                    winbar = 100,
                },
            },
            sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = active_left_sections,
                lualine_x = active_right_sections,
                lualine_y = {},
                lualine_z = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        }

        lualine.setup(config)
    end
}
