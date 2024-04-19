return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            -- set an empty statusline till lualine loads
            vim.o.statusline = ""
        else
            -- hide the statusline on the starter page
            vim.o.laststatus = 0
        end
    end,
    config = function()
        vim.o.laststatus = vim.g.lualine_laststatus

        require("lualine").setup({
            options = {
                globalstatus = true,
                disabled_filetypes = {
                    statusline = {
                        "lazy",
                        "dashboard",
                        "TelescopePrompt",
                        "mason",
                        "noice",
                        "notify",
                        "toggleterm"
                    },
                    winbar = {
                        "lazy",
                        "dashboard",
                        "TelescopePrompt",
                        "mason",
                        "noice",
                        "notify",
                        "NvimTree",
                        "toggleterm"
                    }
                },
            },
            winbar = {
                lualine_c = { { "filename", path = 3 } },
            },
            inactive_winbar = {
                lualine_c = { { "filename", path = 3 } },
            },
            sections = {
                lualine_c = {},
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
           extensions = { "nvim-tree", "toggleterm" },
        })
    end
}
