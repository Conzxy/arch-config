-- Setup the environment variable here.
-- e.g. $PATH

local OsType  = {
    WINDOWS = 1,
    UNIX = 2,
}

local check_current_os = function()
    local os_info = vim.loop.os_uname()
    local os_name = string.lower(os_info.sysname)

    if string.find(os_name, string.lower("Windows")) then
        return OsType.WINDOWS
    else
        return OsType.UNIX
    end
end

local current_os = check_current_os()
local is_windows = current_os == OsType.WINDOWS

local add_env_path = function(paths)
    local separator = ':'
    if is_windows then
        separator = ';'
    end

    for _, path in ipairs(paths) do
        if is_windows then
            path = string.gsub(path, '/', '\\')
        end

        vim.env.PATH = vim.env.PATH .. separator .. path
    end
end


local setup_env_path = function()
    if is_windows then
        add_env_path({
            'C:/Program Files/Git/usr/bin',
            'd:/software/wallpaper-engine-extractor',
            'C:/Program Files/Microsoft Visual Studio/2022/Community/VC/Tools/MSVC/14.41.34120/bin/Hostx64/x64',
            'C:/Users/D5/.vscode/extensions/vadimcn.vscode-lldb-1.11.4/adapter/',
            'D:/software/lua-ls/bin',
        })
    end
end

setup_env_path()
