return {
    "ahmedkhalf/project.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim"
    },
    event = "VeryLazy",
    config = function()
        require("project_nvim").setup({
            detection_methods = { "pattern" },
        })
        require("telescope").load_extension("projects")
    end
}
