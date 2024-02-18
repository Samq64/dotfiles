return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        filters = {
            dotfiles = true,
        }
        vim.keymap.set("n", "<leader>n", ":NvimTreeToggle <CR>", {})
    end,
}
