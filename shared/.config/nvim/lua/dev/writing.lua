local util = require('util')
-- local M = {}

--[[ function M.getCompletionItems(prefix)
  -- define your total completion items
  local items = vim.api.nvim_call_function('vimtex#complete#omnifunc',{0, prefix})
  return items
end

M.complete_item = {
  item = M.getCompletionItems
} ]]

vim.g.vimtex_compiler_progname = 'nvr'
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_method = 'skim'

--[[ util.map('n', '<leader>lcp', '<cmd>VimtexCompile<cr>', util.default_opts)
util.map('n', '<leader>lcl', '<cmd>VimtexClean<cr>', util.default_opts) ]]


--[[ local math = function ()
    return vim.fn.call('vimtex#syntax#in_mathzone', {}) == 1
end

local is_whitespace = function ()
    local _, col = vim.api.nvim_win_get_cursor()
    return vim.api.nvim_get_current_line[col - 1] == ' '
end ]]

-- return M


util.map('i', '<C-l>', '<C-G>u<Esc>[s1z=`]a<C-G>u', util.default_opts)
