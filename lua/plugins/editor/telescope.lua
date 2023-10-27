return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = { 
        'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup()
            end
        }
    },
    event = "VeryLazy",
    config = function()
        require("telescope").setup()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("projects")
    end
}
