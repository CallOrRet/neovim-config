return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    event = "User FileOpened",
    dependencies = {
        "SmiteshP/nvim-navic",
        "onsails/lspkind.nvim",
    },
    config = function()
        require("barbecue").setup({
            attach_navic = false,
            create_autocmd = false,
            kinds = require("lspkind").presets.default,
            exclude_filetypes = {
                'help',
                "lazy",
                "dashboard",
                "toggleterm",
                "TelescopePrompt",
                "mason",
                "noice",
                "notify",
                "NvimTree",
            }
        })

        local ui = require("barbecue.ui")

        vim.api.nvim_create_autocmd({
            "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
            "WinResized",
            "BufWinEnter",
            "CursorHold",
            "InsertLeave",
        }, {
            group = vim.api.nvim_create_augroup("barbecue.updater", {}),
            callback = function()
                ui.update()
            end,
        })
    end
}
