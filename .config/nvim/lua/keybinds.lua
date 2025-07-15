local function map(mode, key, cmd)
    vim.keymap.set(mode, key, cmd, { silent = true, noremap = true })
end

-- Toggles
map("n", "<leader>ts", ":setlocal spell!<CR>")
map("n", "<leader>tr", ":setlocal relativenumber!<CR>")

-- Better splitting
map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

-- Buffers
map("n", "<S-Tab>", ":bprev<CR>")
map("n", "<Tab>", ":bnext<CR>")

map("n", "<leader>bf", vim.lsp.buf.format)

map("n", "grd", vim.diagnostic.open_float)

-- Fix pum wildmenu
vim.api.nvim_set_keymap("c", "<Up>", 'pumvisible() ? "<Left>" : "<Up>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("c", "<Down>", 'pumvisible() ? "<Right>" : "<Down>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("c", "<Left>", 'pumvisible() ? "<Up>" : "<Left>"', { expr = true, noremap = true })
vim.api.nvim_set_keymap("c", "<Right>", 'pumvisible() ? "<Down>" : "<Right>"', { expr = true, noremap = true })

map("n", "<leader>tt", ":ToggleTerm<CR>")
map("t", "<Esc>", "<C-\\><C-n>")
