return {
    {
        "lunarvim/onedarker.nvim",
        lazy = false,
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
        lazy = true,
        -- lazy = false, -- load this default theme
        priority = 1000,
        config = function()
            vim.g.moonflyWinSeparator = 2
            vim.g.moonflyNormalFloat = true
            vim.g.moonflyCursorColor = true
            vim.cmd [[colorscheme moonfly]]
        end
    },
}
