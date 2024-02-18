-- Map the leader key to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy-bootstrap")
require("options")
require("keybinds")

-- https://github.com/nvim-tree/nvim-tree.lua/issues/767
require("nvim-tree").setup()

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})
