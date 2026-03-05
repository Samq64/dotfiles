local function map(mode, key, cmd, opts)
    opts = vim.tbl_extend("force", { silent = true, noremap = true }, opts or {})
    vim.keymap.set(mode, key, cmd, opts)
end

local function pum_remap(from, to)
    vim.keymap.set("c", from, function()
        return vim.fn.pumvisible() == 1 and to or from
    end, { expr = true })
end

local function clean_plugins()
    local inactive = vim.iter(vim.pack.get())
        :filter(function(x) return not x.active end)
        :map(function(x) return x.spec.name end)
        :totable()
    vim.pack.del(inactive)
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
map("n", "<leader>pu", vim.pack.update, { desc = "Update plugins" })
map("n", "<leader>pc", clean_plugins, { desc = "Remove unused plugins" })

-- fzf-lua
map("n", "<leader><leader>", ":FzfLua buffers<CR>")
map("n", "<leader>ff", ":FzfLua files<CR>")
map("n", "<leader>fg", ":FzfLua grep_project<CR>")
map("n", "<leader>fh", ":FzfLua help_tags<CR>")
map("n", "<leader>fr", ":FzfLua resume<CR>")

-- More intuitive menu navigation
-- https://github.com/neovim/neovim/issues/9953
pum_remap("<Up>", "<Left>")
pum_remap("<Down>", "<Right>")
pum_remap("<Left>", "<Up>")
pum_remap("<Right>", "<Down>")
