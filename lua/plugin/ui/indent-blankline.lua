return {
    "lukas-reineke/indent-blankline.nvim",
    -- "CallOrRet/indent-blankline.nvim", -- if you're using neovim version lower then 10.3
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
