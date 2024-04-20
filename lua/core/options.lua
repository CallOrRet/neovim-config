vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.encoding = "UTF-8"

local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- tabs & indentation
opt.tabstop = 4       -- 4 spaces for tabs (prettier default)
opt.shiftwidth = 4    -- 4 spaces for indent width
opt.expandtab = true  -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one
opt.smartindent = true

opt.wrap = true
opt.whichwrap = "<,>,[,],h,l"

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true  -- if you include mixed case in your search, assumes you want case-sensitive

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes"  -- show sign column so that text doesn't shift
opt.colorcolumn = "110"

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- end of buffer char
opt.fillchars = { eob = ' ' }

-- clipboard
-- opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
opt.fileencoding = "utf-8"


opt.cmdheight = 0
opt.showmode = false

-- diabsle mosue support
opt.mouse = ""

opt.updatetime = 300
opt.timeout = true
opt.timeoutlen = 300

-- short prompt message
opt.shortmess:append({ W = true, I = true, c = true, C = true })
-- maximum number of items to show in the popup menu
opt.pumheight = 10


-- minimal number of screen lines to keep above and below
opt.scrolloff = 8
-- minimal number of screen columns to keep to the left
opt.sidescrolloff = 8

opt.shell = "bash"
