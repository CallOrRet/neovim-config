return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            -- CMake, and the Microsoft C++ Build Tools on Windows
            -- build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
        },
    },
    event = "VeryLazy",
    config = function()
        require("telescope").setup()
        require("telescope").load_extension("fzf")
    end
}
