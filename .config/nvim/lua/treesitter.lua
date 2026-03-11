vim.api.nvim_create_autocmd("PackChanged", {
    pattern = "nvim-treesitter",
    callback = function(e)
        local kind = e.data.kind
        if kind == "install" or kind == "update" then
            vim.cmd.TSUpdate()
        end
    end,
})

vim.pack.add { "https://github.com/nvim-treesitter/nvim-treesitter" }

-- Neovim already includes parsers for C, Lua, Markdown and Vimscript
local parsers = {
    "bash",
    "css",
    "cpp",
    "html",
    "javascript",
    "json",
    "make",
    "python",
    "toml",
    "typescript",
    "vue",
    "yaml",
}

require("nvim-treesitter").install(parsers):wait(300000)

vim.api.nvim_create_autocmd("FileType", {
    pattern = parsers,
    callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})
