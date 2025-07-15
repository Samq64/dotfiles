return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("ibl").setup({
                indent = { char = "▏" },
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true
    },
}
