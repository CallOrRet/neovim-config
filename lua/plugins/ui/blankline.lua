return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "User FileOpenedLazy",
    opts = {
        exclude = {
            buftypes = { "nofile", "prompt", "terminal"},
            filetypes = {
                "help",
                "dashboard",
                "lazy",
                "NvimTree",
                "text",
            }
        }
    }
}
