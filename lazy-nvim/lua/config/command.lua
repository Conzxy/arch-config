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