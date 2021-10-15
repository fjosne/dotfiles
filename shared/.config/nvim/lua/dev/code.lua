local util = require('util')

require('Comment').setup({
    ignore = '^$'
})

-- vim-maximizer: maximize current split with <leader>m
util.map('n', '<leader>m', ':MaximizerToggle<cr>', util.default_opts)

-- TODO: Surround, dispatch

