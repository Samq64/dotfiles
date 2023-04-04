local g = vim.g
local o = vim.o

local function map(mode, key, cmd)
    vim.keymap.set(mode, key, cmd, { silent = true })
end


o.number = true
o.smartcase = true
o.cursorline = true

-- Use system clipboard
o.clipboard = 'unnamedplus'

-- Set leader to space
g.mapleader = ' '
g.maplocalleader = ' '

-- Tab settings
o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.wildmode = 'longest,list,full'

-- Better splitting
o.splitbelow = true
o.splitright = true
map('', '<C-h>', '<C-w>h')
map('', '<C-j>', '<C-w>j')
map('', '<C-k>', '<C-w>k')
map('', '<C-l>', '<C-w>l')

-- Ctrl+S to save
map('', '<C-s>', '<CMD>w<CR>')

-- Ctrl+C to quit w/o saving
map('', '<C-c>', '<CMD>q!<CR>')

-- S to replace all
map('n', 'S', ':%s//gI<Left><Left><Left>')

-- leader+S to toggle spellcheck
map('n', '<leader>s', ':setlocal spell! spelllang=en_ca<CR>')

-- leader+O to insert blank line
map('n', '<leader>o', 'o<ESC>0d$')
map('n', '<leader>O', 'O<ESC>0d$')

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = {'*'},
    command = [[%s/\s\+$//e]],
})
