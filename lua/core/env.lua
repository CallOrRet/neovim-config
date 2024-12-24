-- Resolve PATH environment issues for Neovim in containers

local bashrc_vars = vim.fn.system(". ~/.bashrc && env")
for line in bashrc_vars:gmatch("[^\r\n]+") do
    local key, value = line:match("([^=]+)=(.+)")
    if key and value then
        if key == "PATH" then
            vim.env[key] = value
        end
    end
end
