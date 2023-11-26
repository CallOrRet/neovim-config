return {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            -- CMake, and the Microsoft C++ Build Tools on Windows
            -- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
        },
        {
            "ahmedkhalf/project.nvim",
            config = function()
                require("project_nvim").setup({
                    detection_methods = { "pattern" },
                })
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
