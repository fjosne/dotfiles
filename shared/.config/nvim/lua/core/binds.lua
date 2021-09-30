local util = require('util')

util.map('n', 'Y', 'yg$', util.default_opts) -- Better yanking behavior
util.map('n', 'Q', '<nop>', util.default_opts) -- No ex mode
util.map('n', 'q:', ':q', util.default_opts)
util.map('t', '<esc>', '<C-\\><C-n>', util.default_opts) -- Normal mode in terminal

-- nice pane switching
util.map('n', '<C-h>', '<C-w>h', util.default_opts)
util.map('n', '<C-j>', '<C-w>j', util.default_opts)
util.map('n', '<C-k>', '<C-w>k', util.default_opts)
util.map('n', '<C-l>', '<C-w>l', util.default_opts)

util.map('x', '<leader>p', '"_dP', util.default_opts) -- pasting in visual/select mode will not put overwritten text into yank buffer

-- move lines up/down in different modes

util.map('v', 'J', "<cmd>m '>+1<cr>gv=gv", util.default_opts)
util.map('v', 'K', "<cmd>m '<-2<cr>gv=gv", util.default_opts)
util.map('v', '>', ">gv", util.default_opts)
util.map('v', '<', "<gv", util.default_opts)

-- navigate and close qflist
util.map('n', '<C-n>', ':cn<cr>', util.default_opts)
util.map('n', '<C-p>', ':cp<cr>', util.default_opts)
util.map('n', '<leader>cq', ':cclose<cr>', util.default_opts)


