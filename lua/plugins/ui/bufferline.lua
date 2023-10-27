return {
    "akinsho/bufferline.nvim",
    dependencies = {  "moll/vim-bbye" },
    keys = {
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
        { "<leader>bc", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer" },
        { "<leader>bC", "<Cmd>BufferLinePickClose<CR>", desc = "Pick close buffer" },
        { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin buffer" },
        { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Close non-pinned buffers" },
        { "<leader>bd", "<Cmd>Bdelete<CR>", desc = "Close current buffer" },
        { "<leader>bD", "<Cmd>BufferLineCloseOthers<CR>", desc = "Close other buffers" },
    },
    event = "User FileOpened",
    config = function()
        require("bufferline").setup({
            options = {
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
                        padding = 1,
                    } 
                }
            }
        })
    end
}

