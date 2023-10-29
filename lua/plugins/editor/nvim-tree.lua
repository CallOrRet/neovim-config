return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<leader>ff", "<cmd>NvimTreeFocus<CR>", desc = "Focus file explorer" },
        { "<leader>ft", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
        { "<leader>fc", "<cmd>NvimTreeCollapse<CR>", desc = "Collapse file explorer" },
        { "<leader>fr", "<cmd>NvimTreeRefresh<CR>", desc = "Refresh file explorer" },
    },
    event = "User DirOpened",
    config = function()

        require("nvim-tree").setup({
            view = {
                relativenumber = true,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
                icons = {
                    glyphs = {
                        git = {
                            unstaged = "󰝦", -- 
                            staged = "󰐙", -- 
                            unmerged = "",
                            renamed = "󰳠", -- 
                            deleted = "󰍷", -- 
                            untracked = "󱨧", -- 
                            ignored = "◌",
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            -- actions = {
            --     open_file = {
            --         window_picker = {
            --             enable = false,
            --         },
            --     },
            -- },
            filters = {
                dotfiles = true,
                custom = { ".DS_Store" },
            },
            git = {
                enable = true,
                ignore = false,
            },
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true
            },
        })
    end,
}
