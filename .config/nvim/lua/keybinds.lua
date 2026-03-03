local function map(mode, key, cmd, opts)
    opts = vim.tbl_extend("force", { silent = true, noremap = true }, opts or {})
    vim.keymap.set(mode, key, cmd, opts)
end

local function inactive_plugins()
    return vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()
end

-- Map leader to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Toggles
map("n", "<leader>ts", ":setlocal spell!<CR>")
map("n", "<leader>tr", ":setlocal relativenumber!<CR>")
map("n", "<leader>tw", ":setlocal wrap!<CR>")
map("n", "<leader>te", ":NvimTreeToggle<CR>")
map("n", "<leader>tt", ":ToggleTerm<CR>")

map("t", "<Esc>", "<C-\\><C-n>")

-- Replace all
map("n", "<leader>s", ":%s//g<Left><Left>", { silent = false, desc = "Replace all" })

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
map("n", "<leader>bf", vim.lsp.buf.format, { desc = "Format buffer" })
map("n", "grd", vim.diagnostic.open_float, { desc = "Open diagnostics float" })

-- vim.pack
map("n", "<leader>pu", function() vim.pack.update() end, { desc = "Update plugins" })
map("n", "<leader>pc", function() vim.pack.del(inactive_plugins()) end, { desc = "Remove unused plugins" })

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
