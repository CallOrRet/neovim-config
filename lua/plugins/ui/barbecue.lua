return {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    event = "User FileOpenedLazy",
    dependencies = {
        "SmiteshP/nvim-navic",
    },
    opts = {
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
    }
}
