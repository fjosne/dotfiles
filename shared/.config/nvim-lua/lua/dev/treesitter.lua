require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "python", "lua", "comment"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- Enable syntax highlighting
    },
    indent = {
        enable = true,            -- Enable language specific indentation
    },
}
