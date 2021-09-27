local util = require('util')
local actions = require('telescope.actions')
-- extensions
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('bibtex')
require('telescope').load_extension('cheat')

require('telescope').setup {
    defaults = {
        filre_sorter = require('telescope.sorters').get_fzy_sorter,
        file_ignore_patterns = {"__pycache__/", "node_modules/", ".git/"},
        shorten_path = false,
        color_devicons = true,

        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '-uu'
        },

        file_previewer = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-q>"] = actions.send_to_qflist,
            },
        },

    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
    },
}


util.map('n', '<leader>ff', '<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>', util.default_opts)
util.map('n', '<leader>df', '<cmd>lua require("telescope.builtin").find_files {cwd = "$XDG_CONFIG_HOME/cfg/"}<cr>', util.default_opts)
util.map('n', '<leader>fl', '<cmd>Telescope live_grep<cr>', util.default_opts)
util.map('n', '<leader>ft', '<cmd>Telescope tags<cr>', util.default_opts)
util.map('n', '<C-x>d', '<cmd>Telescope file_browser<cr>', util.default_opts)

