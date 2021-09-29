local util = require('util')

local BinaryFormat = package.cpath:match("%p[\\|/]?%p(%a+)")
local os = nil
if BinaryFormat == "dll" then
    os = "Windows"
elseif BinaryFormat == "so" then
    os = "Linux"
elseif BinaryFormat == "dylib" then
    os = "MacOS"
end

BinaryFormat = nil

local dracula = function()
    vim.cmd('autocmd ColorScheme dracula highlight DraculaRedInverse guibg=NONE guifg=#ff5555')
    if os == "Linux" then
        vim.cmd('autocmd ColorScheme dracula highlight Normal guibg=NONE')
    end
    vim.cmd('autocmd ColorScheme dracula highlight Sneak guibg=#bd93f9')
    vim.cmd('colo dracula')
end

-- dracula()
vim.cmd('colo gruvbox')



vim.g.indentLine_char_list = {'│'}


-- Key bindings
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
util.map('n', '<leader>qc', ':cclose<cr>', util.default_opts)

-- close split
util.map('n', '<leader>cc', ':close<cr>', util.default_opts)


util.map('t', '<esc>', '<C-\\><C-n>', util.default_opts)


-- set syntax highlighting in emerald files
vim.cmd('au BufNewFile,BufRead *.m setlocal ft=emerald')
