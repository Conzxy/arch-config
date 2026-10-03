local register_command = vim.api.nvim_create_user_command

register_command('AddModuleComment', function() 
    local lines = {
        "/*--------------------------------------------------*/",
        "/*                                                  */",
        "/*--------------------------------------------------*/",
        "",
    }
    vim.api.nvim_put(lines, "l", true, true)
end, {})

register_command('SetupDev', function() 
    vim.cmd('Vista!!')
    vim.cmd('NvimTreeToggle')
end, {})

vim.o.updatetime = 100 -- ms

vim.api.nvim_create_autocmd("CursorHold", {
    pattern = { "*.rs" , "*.lua", },
    callback = function()
        vim.diagnostic.open_float(nil, { focus = false, scope = "line" })
        -- vim.cmd.RustLsp({'renderDiagnostic', 'current'})
    end,
})
