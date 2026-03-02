local function map(mode, key, cmd)
    vim.keymap.set(mode, key, cmd, { silent = true, noremap = true })
end

-- Map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Toggles
map("n", "<leader>ts", ":setlocal spell!<CR>")
map("n", "<leader>tr", ":setlocal relativenumber!<CR>")
map("n", "<leader>tw", ":set wrap!<CR>")
map("n", "<leader>te", ":NvimTreeToggle<CR>")
map("n", "<leader>tt", ":ToggleTerm<CR>")

map("t", "<Esc>", "<C-\\><C-n>")

-- Replace all
vim.keymap.set("n", "<leader>s", ":%s//g<Left><Left>")

-- Better splitting
map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

-- Buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprev<CR>")
map("n", "<leader>q", ":bd<CR>")
map("n", "<leader>Q", ":bd!<CR>")

-- LSP
map("n", "<leader>bf", vim.lsp.buf.format)
map("n", "grd", vim.diagnostic.open_float)

-- fzf-lua
map("n", "<leader><leader>", ":FzfLua buffers<CR>")
map("n", "<leader>ff", ":FzfLua files<CR>")
map("n", "<leader>fg", ":FzfLua grep_project<CR>")
map("n", "<leader>fh", ":FzfLua help_tags<CR>")
map("n", "<leader>fr", ":FzfLua resume<CR>")

-- More intuitive menu navigation
-- https://github.com/neovim/neovim/issues/9953
vim.api.nvim_set_keymap("c", "<Up>", 'pumvisible() ? "<Left>" : "<Up>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("c", "<Down>", 'pumvisible() ? "<Right>" : "<Down>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("c", "<Left>", 'pumvisible() ? "<Up>" : "<Left>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("c", "<Right>", 'pumvisible() ? "<Down>" : "<Right>"', { expr = true, noremap = true })
