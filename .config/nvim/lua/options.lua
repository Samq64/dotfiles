local o = vim.opt

o.number = true
o.smartcase = true
o.cursorline = true
o.termguicolors = true
o.swapfile = false
o.signcolumn = "yes"
o.winborder = "rounded"

-- Use system clipboard
o.clipboard = "unnamedplus"

-- Tab settings
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true
o.wildmode = "longest:full,full"

o.splitbelow = true
o.splitright = true

o.timeout = true
o.timeoutlen = 300

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99
o.scrolloff = 5
