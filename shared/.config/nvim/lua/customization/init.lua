local util = require('util')

-- get OS
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
vim.opt.background="dark"
vim.cmd('colo gruvbox-material')

if os == "Linux" then
    vim.cmd('au ColorScheme * highlight Normal ctermbg=NONE guibg=NONE')
end

-- more consistent highlighting of keywords
vim.cmd('au ColorScheme * highlight link TSKeywordOperator Keyword')

vim.g.indentLine_char_list = {'│'}

require('customization.statusline')
