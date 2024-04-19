return {
    {
        "lunarvim/onedarker.nvim",
        lazy = false, -- load this default theme
        priority = 1000,
        opts = {},
    },
    {
        "navarasu/onedark.nvim",
        lazy = true,
        priority = 1000,
        opts = { sytle = "warmer" }, -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    }
}
