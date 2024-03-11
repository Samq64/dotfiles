local function map(mode, key, cmd)
    vim.keymap.set(mode, key, cmd, { silent = true })
end

-- Ctrl+S to save
map("", "<C-s>", "<CMD>w<CR>")

-- Ctrl+C to quit w/o saving
map("", "<C-c>", "<CMD>q!<CR>")

-- leader+r to replace all
map("n", "<leader>r", ":%s///gI<Left><left><Left><Left>")

-- leader+S to toggle spellcheck
map("n", "<leader>s", ":setlocal spell! spelllang=en_ca<CR>")

-- leader+O to insert blank line
map("n", "<leader>o", "o<ESC>0d$")
map("n", "<leader>O", "O<ESC>0d$")

-- Better splitting
map("", "<C-h>", "<C-w>h")
map("", "<C-j>", "<C-w>j")
map("", "<C-k>", "<C-w>k")
map("", "<C-l>", "<C-w>l")

-- Bufffers
map("", "<C-Left>", ":bprev<CR>")
map("", "<C-Right>", ":bnext<CR>")
