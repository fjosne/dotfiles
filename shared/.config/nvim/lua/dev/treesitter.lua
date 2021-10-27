require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
        "cmake",
        "cuda",
        "python",
        "lua",
        "comment",
        "bash",
        "html",
        "java",
        "json",
        "latex",
        "bibtex",
        "regex",
        "vim",
        "org",
    }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- Enable syntax highlighting
    },
    indent = {
        enable = true,            -- Enable language specific indentation
        disable = {"python"}
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            -- scope_incremental = "<C-s>",
            node_decremental = "<BS>",
        },
    },
}

