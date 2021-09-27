local util = require('util')
util.map('n', 's', '<Plug>Sneak_s', {silent = true})

util.map('n', '<C-h>', '<C-w>h', util.default_opts)
util.map('n', '<C-j>', '<C-w>j', util.default_opts)
util.map('n', '<C-k>', '<C-w>k', util.default_opts)
util.map('n', '<C-l>', '<C-w>l', util.default_opts)

util.map('n', 'q:', ':q', util.default_opts)

util.map('v', 'J', "<cmd>m '>+1<cr>gv=gv", util.default_opts)
util.map('v', 'K', "<cmd>m '<-2<cr>gv=gv", util.default_opts)
util.map('v', '>', ">gv", util.default_opts)
util.map('v', '<', "<gv", util.default_opts)

-- navigate qflist
util.map('n', '<C-n>', ':cn<cr>', util.default_opts)
util.map('n', '<C-p>', ':cp<cr>', util.default_opts)
-- close qflist
util.map('n', '<leader>cq', ':cclose<cr>', util.default_opts)

-- close split
util.map('n', '<leader>cc', ':close<cr>', util.default_opts)


util.map('t', '<esc>', '<C-\\><C-n>', util.default_opts)

