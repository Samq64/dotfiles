vim.pack.add({
    "https://github.com/nvimtools/none-ls.nvim",
    "https://github.com/neovim/nvim-lspconfig",
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            telemetry = { enable = false },
            format = {
                defaultConfig = {
                    quote_style = "double",
                    trailing_table_separator = "smart",
                },
            },
        },
    },
})

-- Package names are for Arch Linux
vim.lsp.enable({
    "clangd", -- clang
    "jsonls", -- vscode-json-languageserver
    "lua_ls", -- lua-language-server
    "pyright",
})

local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black, -- python-black
        null_ls.builtins.formatting.prettier,
    },
})
