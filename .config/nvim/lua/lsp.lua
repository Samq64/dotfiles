vim.lsp.config("*", {
    root_markers = { ".git" },
})

vim.lsp.config["luals"] = {
    cmd = { "lua-language-server" },
    filetypes = { "lua" },
    root_markers = { ".luarc.json", ".luarc.jsonc" },
    settings = {
        Lua = {
            telemetry = {
                enable = false,
            },
            format = {
                enable = true,
                defaultConfig = {
                    quote_style = "double",
                    trailing_table_separator = "smart",
                },
            },
        },
    },
}

vim.lsp.config["ts_ls"] = {
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "typescript" },
    root_markers = { "eslint.config.mjs", ".prettierrc.json", ".prettierignore" },
}

vim.lsp.config["clangd"] = {
    cmd = { "clangd" },
    root_markers = { ".", "Makefile" },
    filetypes = { "c", "cpp" },
}

vim.lsp.config.bashls = {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'bash', 'sh' }
}

vim.diagnostic.config({
    --virtual_lines = true;
    virtual_text = { current_line = true },
})

vim.lsp.enable({ "luals", "ts_ls", "clangd", "bashls" })
