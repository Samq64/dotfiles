vim.pack.add({
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",

    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/lukas-reineke/indent-blankline.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/catgoose/nvim-colorizer.lua",
    "https://github.com/nvim-tree/nvim-tree.lua",
    "https://github.com/akinsho/toggleterm.nvim",
    "https://github.com/folke/which-key.nvim",
})

require("colorizer").setup()
require("fzf-lua").setup()
require("gitsigns").setup()
require("which-key").setup()

require("ibl").setup({
    indent = { char = "▏" },
})

require("lualine").setup({
    options = { theme = "auto" },
    sections = {
        lualine_c = { "buffers" },
    },
})

require("nvim-tree").setup({
    filters = { dotfiles = true },
})

require("toggleterm").setup({
    persist_mode = false,
})
