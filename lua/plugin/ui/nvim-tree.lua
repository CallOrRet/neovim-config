return {
    "nvim-tree/nvim-tree.lua",
    event = "User DirOpenedLazy",
    cmd = {
        "NvimTreeFocus",
        "NvimTreeToggle",
        "NvimTreeCollapse",
        "NvimTreeRefresh",
    },
    config = function()
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

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
                            unstaged = "", -- 󰰐 ,   modified
                            staged = "", -- 󰯬 ,  added
                            unmerged = "", -- 󰰨 ,  updated but unmerged
                            renamed = "", -- 󰰟 ,  renamed
                            deleted = "", -- 󰯵 ,  deleted
                            untracked = "", -- 󰰓 ,  new file
                            ignored = "◌", -- ignored
                        },
                    },
                },
            },
            -- disable window_picker for
            -- explorer to work well with
            -- window splits
            actions = {
                open_file = {
                    window_picker = {
                        enable = false,
                    },
                },
            },
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
        })
    end,
}
