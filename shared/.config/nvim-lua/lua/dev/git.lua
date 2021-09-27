local util = require('util')
-- Git functionality

-- Git status
util.map('n', '<leader>gg', ':G<cr>', util.default_opts)
util.map('n', '<leader>gb', ':Telescope git_branches<cr>', util.default_opts)
util.map('n', '<leader>gf', ':Telescope git_files<cr>', util.default_opts)
util.map('n', '<leader>gd', ':Gdiffsplit<cr>', util.default_opts)
util.map('n', '<leader>gps', ':G push<cr>', util.default_opts)
util.map('n', '<leader>gpl', ':G pull<cr>', util.default_opts)

