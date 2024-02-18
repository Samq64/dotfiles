local o = vim.opt

o.number = true
o.smartcase = true
o.cursorline = true
o.termguicolors = true

-- Use system clipboard
o.clipboard = "unnamedplus"

-- Tab settings
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.wildmode = "longest,list,full"

o.splitbelow = true
o.splitright = true

vim.o.timeout = true
vim.o.timeoutlen = 300
