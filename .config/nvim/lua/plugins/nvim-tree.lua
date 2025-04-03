return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            filters = {
                dotfiles = true,
            },
        })
        vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle <CR>", { silent = true })
    end,
}
