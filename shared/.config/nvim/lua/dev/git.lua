local util = require('util')

local neogit = require('neogit')

neogit.setup {
    disable_hint = true,
    integrations = {
        diffview = true,
    }
}


require('git').setup({
     keymaps = {
        -- Open blame window
        blame = "<Leader>b",
        -- Close blame window
        quit_blame = "<Leader>b",
    }
})

require('gitsigns').setup({
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text_pos = 'eol',
        delay = 0
    }

})

util.map('n', '<leader>gg', ':Neogit<cr>', util.default_opts)
util.map('n', '<leader>gb', ':Telescope git_branches<cr>', util.default_opts)
util.map('n', '<leader>gf', ':Telescope git_files<cr>', util.default_opts)
--[[ util.map('n', '<leader>gd', ':Gdiffsplit<cr>', util.default_opts)
util.map('n', '<leader>gps', ':G push<cr>', util.default_opts)
util.map('n', '<leader>gpl', ':G pull<cr>', util.default_opts) ]]

