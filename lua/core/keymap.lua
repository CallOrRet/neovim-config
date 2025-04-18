local keymap = vim.keymap.set

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- utils
-- use jk to quick exit insert/visual mode
keymap("n", "<c-q>", "<cmd>quitall<cr>", { desc = "quit all" })
keymap({ "i", "v", "c" }, "jk", "<esc>")
-- better moving
keymap("i", "<c-h>", "<left>")
keymap("i", "<c-l>", "<right>")
keymap("i", "<c-j>", "<down>")
keymap("i", "<c-k>", "<up>")
-- move line within current mode
keymap("n", "<m-j>", "<cmd>m .+1<cr>==", { desc = "move line down" })
keymap("n", "<m-k>", "<cmd>m .-2<cr>==", { desc = "move line up" })
keymap("i", "<m-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "move line down" })
keymap("i", "<m-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "move line up" })
keymap("v", "<m-j>", "<cmd>m '>+1<cr>gv=gv", { desc = "move line down" })
keymap("v", "<m-k>", "<cmd>m '<-2<cr>gv=gv", { desc = "move line up" })
-- delete single character without copying into register
keymap("n", "x", '"_x')
-- better pasting
keymap("v", "p", '"_dp', { desc = "better paste" })
-- better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")
-- clear search highlights
keymap({ "n", "v" }, "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "clear search highlights" })

-- file
-- save file
keymap({ "n", "i", "v" }, "<c-s>", "<cmd>w<cr><esc>", { desc = "save file" })
-- new file
keymap("n", "<c-n>", "<cmd>ene!<cr><esc>", { desc = "new file" })

-- window
-- jump
keymap({ "n", "t" }, "<c-h>", "<cmd>wincmd h<cr>", { desc = "go to left window" })
keymap({ "n", "t" }, "<c-j>", "<cmd>wincmd j<cr>", { desc = "go to lower window" })
keymap({ "n", "t" }, "<c-k>", "<cmd>wincmd k<cr>", { desc = "go to upper window" })
keymap({ "n", "t" }, "<c-l>", "<cmd>wincmd l<cr>", { desc = "go to right window" })
-- management
keymap("n", "<leader>wn", "<c-w>p", { desc = "other window" })
keymap("n", "<leader>wd", "<c-w>c", { desc = "close window" })
keymap("n", "<leader>wb", "<c-w>s", { desc = "split window below" })
keymap("n", "<leader>wr", "<c-w>v", { desc = "split window right" })
-- resize
keymap("n", "<leader>wk", "<cmd>resize +2<cr>", { desc = "increase window height" })
keymap("n", "<leader>wj", "<cmd>resize -2<cr>", { desc = "decrease window height" })
keymap("n", "<leader>wl", "<cmd>vertical resize +2<cr>", { desc = "increase window width" })
keymap("n", "<leader>wh", "<cmd>vertical resize -2<cr>", { desc = "decrease window width" })
keymap("n", "<leader>we", "<c-w>=", { desc = "equal window width" })

-- tab
keymap("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "last tab" })
keymap("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "first tab" })
keymap("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "new tab" })
keymap("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "close tab" })
keymap("n", "]t", "<cmd>tabnext<cr>", { desc = "next tab" })
keymap("n", "[t", "<cmd>tabprevious<cr>", { desc = "previous tab" })

-- terminal
keymap({ "n", "t" }, "<leader><leader>v", "<cmd>ToggleTerm size=60 direction=vertical<cr>",
    { desc = "toggle terminal vertically" })
keymap({ "n", "t" }, "<leader><leader>h", "<cmd>ToggleTerm size=15 direction=horizontal<cr>",
    { desc = "toggle terminal horizontally" })
keymap({ "n", "t" }, "<leader><leader>f", "<cmd>ToggleTerm direction=float<cr>",
    { desc = "toggle terminal float" })
keymap({ "n", "t" }, "<leader><leader>s", "<cmd>TermSelect<cr>",
    { desc = "select terminal" })
keymap({ "n", "t" }, "<leader><leader>t", "<cmd>ToggleTerm size=15 direction=horizontal<cr>",
    { desc = "toggel all terminal" })
keymap({ "n", "t" }, "<leader><leader>n", "<cmd>lua require('toggleterm.terminal').Terminal:new():toggle()<cr>",
    { desc = "select terminal" })
keymap("t", "<leader><leader>j", "<c-\\><c-n>", { desc = "terminal enter normal mode" })

-- nvimtree
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "toggle file explorer" })

-- BufferLine
keymap("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "prev buffer" })
keymap("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "next buffer" })
keymap("n", "<leader>bc", "<cmd>BufferLinePick<cr>", { desc = "pick buffer" })
keymap("n", "<leader>bC", "<cmd>BufferLinePickClose<cr>", { desc = "pick close buffer" })
keymap("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "toggle pin buffer" })
keymap("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", { desc = "close non-pinned buffers" })
keymap("n", "<leader>bd", "<cmd>Bdelete<cr>", { desc = "close current buffer" })
keymap("n", "<leader>bD", "<cmd>BufferLineCloseOthers<cr>", { desc = "close other buffers" })
keymap("n", "<leader>bf", "<cmd>Bdelete!<cr>", { desc = "force close current buffer" })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "find files by text" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "find buffers" })
keymap("n", "<leader>fn", "<cmd>Telescope notify<cr>", { desc = "find notify" })
keymap("n", "<leader>ft", "<cmd>Telescope help_tags<cr>", { desc = "find help tags" })

-- Gitsigns
keymap("n", "]g", "<cmd>Gitsigns next_hunk<cr>", { desc = "next git hunk" })
keymap("n", "[g", "<cmd>Gitsigns prev_hunk<cr>", { desc = "prev git hunk" })
