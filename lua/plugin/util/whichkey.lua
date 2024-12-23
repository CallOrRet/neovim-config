return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        disable = { filetypes = { "TelescopePrompt", "toggleterm" } },
    },
    keys = {
        {
            "<leader>?",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
