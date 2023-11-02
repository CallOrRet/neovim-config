local keymap = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Utils
-- use jk to quick exit insert/visual mode
keymap({ "i", "v" }, "jk", "<esc>")
-- better moving
keymap("i", "<M-g>", "<esc>I")
keymap("i", "<M-;>", "<esc>A")
keymap("i", "<M-h>", "<esc>ha")
keymap("i", "<M-l>", "<esc>la")
keymap("i", "<M-j>", "<esc>ja")
keymap("i", "<M-k>", "<esc>ka")
-- move line within current mode
keymap("n", "<M-d>", ":m .+1<cr>==", { desc = "Move line down" })
keymap("n", "<M-u>", ":m .-2<cr>==", { desc = "Move line up" })
keymap("i", "<M-d>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down" })
keymap("i", "<M-u>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up" })
keymap("v", "<M-d>", ":m '>+1<cr>gv=gv", { desc = "Move line down" })
keymap("v", "<M-u>", ":m '<-2<cr>gv=gv", { desc = "Move line up" })
-- delete single character without copying into register
keymap("n", "x", '"_x')
-- better pasting
keymap("v", "p", '"_dP', { desc = "Better paste" })
-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- clear search highlights
keymap("n", "<leader>h", ":nohlsearch<cr>", { desc = "clear search highlights" })

-- File
-- save file
keymap({ "i", "v", "n"}, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
-- new file
keymap({ "i", "v", "n"}, "<C-n>", "<cmd>ene!<cr><esc>", { desc = "New file" })

-- Window
-- jump
keymap({ "n", "v", "t" }, "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
keymap({ "n", "v", "t" }, "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
keymap({ "n", "v", "t" }, "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
keymap({ "n", "v", "t" }, "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
-- management
keymap("n", "<leader>ww", "<C-w>p", { desc = "Other window" })
keymap("n", "<leader>wd", "<C-w>c", { desc = "Close window" })
keymap("n", "<leader>wb", "<C-w>s", { desc = "Split window below" })
keymap("n", "<leader>wr", "<C-w>v", { desc = "Split window right" })
-- resize 
keymap("n", "<leader>wk", ":resize +2<cr>", { desc = "Increase window height" })
keymap("n", "<leader>wj", ":resize -2<cr>", { desc = "Decrease window height" })
keymap("n", "<leader>wl", ":vertical resize +2<cr>", { desc = "Increase window width" })
keymap("n", "<leader>wh", ":vertical resize -2<cr>", { desc = "Decrease window width" })
keymap("n", "<leader>we", "<C-w>=", { desc = "equal window width" })

-- Tab
keymap("n", "<leader>tl", ":tablast<cr>", { desc = "Last Tab" })
keymap("n", "<leader>tf", ":tabfirst<cr>", { desc = "First Tab" })
keymap("n", "<leader>tt", ":tabnew<cr>", { desc = "New Tab" })
keymap("n", "<leader>td", ":tabclose<cr>", { desc = "Close Tab" })
keymap("n", "]t", ":tabnext<cr>", { desc = "Next Tab" })
keymap("n", "[t", ":tabprevious<cr>", { desc = "Previous Tab" })

-- Terminal
keymap({ "i", "v", "n", "t"}, "<C-/>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
keymap("t", "<C-[>", "<C-\\><C-n>", { desc = "Enter normal mode" })

-- NvimTree
keymap("n", "<leader>ef", "<cmd>NvimTreeFocus<CR>", { desc = "Focus file explorer" })
keymap("n", "<leader>et", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
keymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- Bufferline
keymap("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
keymap("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
keymap("n", "<leader>bc", "<Cmd>BufferLinePick<CR>", { desc = "Pick buffer" })
keymap("n", "<leader>bC", "<Cmd>BufferLinePickClose<CR>", { desc = "Pick close buffer" })
keymap("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin buffer" })
keymap("n", "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Close non-pinned buffers" })
keymap("n", "<leader>bd", "<Cmd>Bdelete<CR>", { desc = "Close current buffer" })
keymap("n", "<leader>bD", "<Cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })
keymap("n", "<leader>bf", "<Cmd>Bdelete!<CR>", { desc = "Force close current buffer" })
