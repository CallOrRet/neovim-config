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
    end
}
