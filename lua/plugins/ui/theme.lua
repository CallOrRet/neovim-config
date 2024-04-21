return {
    {
        "nvim-tree/nvim-web-devicons", -- devicons
        lazy = false,
        priority = 1001
    },
    {
        "lunarvim/onedarker.nvim",
        lazy = true,
        priority = 1000,
        opts = {},
    },
    {
        "navarasu/onedark.nvim",
        lazy = true,
        priority = 1000,
        opts = { sytle = "warmer" }, -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    },
    {

        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false, -- load this default theme
        priority = 1000,
        config = function()
            vim.g.moonflyWinSeparator = 2
            vim.g.moonflyNormalFloat = true
            vim.g.moonflyTransparent = true
            vim.cmd [[colorscheme moonfly]]
            vim.api.nvim_set_hl(0, "Type", { link = "MoonflyOrange" })
            vim.api.nvim_set_hl(0, "@type.builtin", { link = "MoonflyGreen" })
        end
    },
}
