return {
    'mfussenegger/nvim-dap',
    lazy = false,
    config = function()
        local dap = require('dap')

        dap.adapters.codelldb = {
            type = 'server',
            host = '127.0.0.1',
            port = 13000
        }

        dap.configurations.c = {
            {
                type = 'codelldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
                end,
                --program = '${fileDirname}/${fileBasenameNoExtension}',
                cwd = '${workspaceFolder}',
                terminal = 'integrated'
            }
        }

        dap.configurations.cpp = dap.configurations.c

        dap.configurations.rust = {
            {
                type = 'codelldb',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd()..'/', 'file')
                end,
                cwd = '${workspaceFolder}',
                terminal = 'integrated',
                sourceLanguages = { 'rust' }
            }
        }

        local keymap = vim.keymap.set

        keymap('n', '<F5>', function() dap.continue() end)
        keymap('n', '<F10>', function() dap.step_over() end)
        -- In some terminal simulator, the F11 is hotkey of the fullscreen action,
        -- you need overwrite this behavior or set other keymap.
        keymap('n', '<F11>', function() dap.step_into() end)
        keymap('n', '<F12>', function() dap.step_out() end)
        keymap('n', '<C-b>', function() dap.toggle_breakpoint() end)
        keymap('n', '<m-b>', function() dap.list_breakpoint() end)
    end
}
