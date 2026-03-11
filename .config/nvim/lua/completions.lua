vim.pack.add {
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    {
        src = "https://github.com/saghen/blink.cmp",
        version = vim.version.range("1"),
    },
}

local exclude = { "markdown", "text" }

require("blink.cmp").setup {
    enabled = function() return not vim.tbl_contains(exclude, vim.bo.filetype) end,
    fuzzy = { implementation = "prefer_rust" },
    keymap = { preset = "super-tab" },
    cmdline = { enabled = false },
}
