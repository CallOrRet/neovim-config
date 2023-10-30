return {
    "nvim-tree/nvim-tree.lua",
    event = "User DirOpened",
    cmd = {
        "NvimTreeFocus",
        "NvimTreeToggle",
        "NvimTreeCollapse",
        "NvimTreeRefresh",
    },
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
                            unstaged = "󰰐", --   modified
                            staged = "󰯬", --  added
                            unmerged = "󰰨", --  updated but unmerged
                            renamed = "󰰟", --  renamed
                            deleted = "󰯵", --  deleted
                            untracked = "󰰓", --  new file
                            ignored = "◌", -- ignored
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
