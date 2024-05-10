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
