-- Module with common utilities for easier customization of nvim using lua
local util = {}
util.default_opts = { noremap = true, silent = true }

util.t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function util.map(mode, lhs, rhs, opts)
    --table.insert(util, default_opts)
    -- function for mapping keys
    -- mode = 'n', 'i', 'v', etc.
    -- lhs = mapping to trigger action
    -- rhs = action to be triggered by mapping
    -- opts = additional options (silent, noremap, ...)
    vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

return util
