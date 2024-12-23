return {
    "folke/noice.nvim",
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        {
            "rcarriga/nvim-notify",
            opts = {
                fps = 1,
                render = "compact",
                stages = "no_animation",
                timeout = 1500,
            },
        },
        "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    config = function()
        require("noice").setup({
            cmdline = {
                format = {
                    search_down = { icon = " 󰁅" },
                    search_up = { icon = " 󰁝" }
                }
            },
            lsp = {
                hover = {
                    enabled = false
                },
                signature = {
                    enabled = false
                },
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = true,       -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- add a border to hover docs and signature help
            },
        })

        require("telescope").load_extension("noice")
        require("telescope").load_extension("notify")
    end
}
