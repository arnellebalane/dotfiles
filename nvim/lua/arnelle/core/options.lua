vim.cmd('let g:netrw_liststyle = 3')

-- line numbers
vim.opt.relativenumber = true
vim.opt.number = true

-- tabs and indentations
vim.opt.tabstop = 2 -- spaces for tabs
vim.opt.shiftwidth = 2 -- spaces for indent width
vim.opt.expandtab = true -- expand tabs to spaces
vim.opt.autoindent = true -- copy indent from current line when starting a new line

vim.opt.wrap = false

-- search
vim.opt.ignorecase = true -- ignore case when searching...
vim.opt.smartcase = true -- ...unless searching with mixed case, then assume case-sensitive

vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- theme
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes:1"
vim.opt.cmdheight = 0

-- backspace
vim.opt.backspace = "indent,eol,start"

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vim.opt.laststatus = 3 -- put statusline globally instead of per split
vim.opt.splitright = true -- split vertically to the right
vim.opt.splitbelow = true -- split horizontally to the bottom
