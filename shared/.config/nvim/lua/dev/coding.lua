local util = require('util')

-- Snippets
vim.g.UltiSnipsEditSplit = 'context'
vim.g.UltiSnipsExpandTrigger = '<tab>'
vim.g.UltiSnipsJumpForwardTrigger = '<tab>'
vim.g.UltiSnipsJumpBackwardTrigger = '<S-tab>'


-- Easy commenting using gcc (line) or any other gc{motion}
require('kommentary.config').use_extended_mappings()

-- Commenting for emerald programming language
require('kommentary.config').configure_language("emerald", {
    prefer_single_line_comments = true,
    single_line_comment_string = "%",
    multi_line_comment_strings = false
})

-- Auto pair parens
require('nvim-autopairs').setup{ disable_filetype = {"TelescopePrompt"}, }

-- vim-maximizer: maximize current split with <leader>m
util.map('n', '<leader>m', ':MaximizerToggle<cr>', util.default_opts)

-- TODO: Surround, dispatch

vim.g.gutentags_dont_load = 1
