vim.g.mapleader = ' '

vim.cmd('let VIMRUNTIME = "/usr/local/src/neovim/runtime"')

require('plugins')
require('opts')
require('customization')
require('dev')

