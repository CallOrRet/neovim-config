return {
    {
        "lunarvim/onedarker.nvim",
        lazy = true,
        priority = 1000,
        opts = {},
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,                -- load this theme
        priority = 1000,
        opts = { sytle = "warmer" }, -- Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        config = function()
            require('onedark').load()
            local colors = require('onedark.colors')
            vim.api.nvim_set_hl(0, "NvimTreeExecFile", { fg = colors.fg })
            vim.api.nvim_set_hl(0, "NvimTreeSpecialFile", { fg = colors.red})
        end
    }
}
