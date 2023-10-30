return {
    "nvim-lualine/lualine.nvim",
    -- event = "VimEnter",
    event = "VeryLazy",
    config = function()
        require("lualine").setup({
            options = {
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "TelescopePrompt" } },
            },
            sections = {
                lualine_c = {
                    {
                        "filename",
                        path = 3,
                    },
                },
                lualine_x = {
                    {
                        require("lazy.status").updates,
                        cond = require("lazy.status").has_updates,
                    },
                    { "filesize" },
                    {
                        "fileformat",
                        symbols = {
                            unix = "LF",
                            dos = "CRLF",
                            mac = "CR",
                        },
                    },
                    { "encoding" },
                    { "filetype" },
                },
            },
            extensions = { "lazy", "nvim-tree", "toggleterm" },
        })
    end
}
