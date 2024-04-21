return {
    "akinsho/bufferline.nvim",
    dependencies = { "moll/vim-bbye" },
    event = "VeryLazy",
    cmd = {
        "BufferLineCyclePrev",
        "BufferLineCycleNext",
        "BufferLinePick",
        "BufferLinePickClose",
        "BufferLineTogglePin",
        "BufferLineGroupClose",
        "BufferLineCloseOthers",
    },
    config = function()
        require("bufferline").setup({
            options = {
                separator_style = {},
                indicator = {
                    style = "underline"
                },
                close_command = "Bdelete! %d",
                show_buffer_icons = false,
                show_buffer_close_icons = false,
                show_close_icon = false,
                always_show_bufferline = false,
                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "Explorer",
                        highlight = "Directory",
                        text_align = "left",
                    }
                }
            }
        })
    end
}
