return {
    -- "lukas-reineke/indent-blankline.nvim",
    "CallOrRet/indent-blankline.nvim",
    main = "ibl",
    event = "User FileOpenedLazy",
    config = function()
        require("ibl").setup({
            indent = { char = "┊" },
            exclude = {
                buftypes = { "nofile", "prompt", "terminal" },
                filetypes = {
                    "help",
                    "dashboard",
                    "lazy",
                    "NvimTree",
                    "text",
                }
            }
        })
    end
}
