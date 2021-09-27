local global = vim.o
local window = vim.wo
local buffer = vim.bo

global.errorbells       = false     -- no audible error bells
global.ruler            = true      -- add row and column info
window.relativenumber   = true      -- relative line numbers
window.number           = true      -- add line numbers
window.wrap             = false     -- dont soft wrap lines when going off screen
global.hidden           = true      -- dont unload buffers when they're abandoned
global.incsearch        = true      -- incremental search results
global.cmdheight        = 2         -- increase size of cmd line
global.updatetime       = 300       -- faster update times (300ms)
global.scrolloff        = 8         -- start scroll when 8 lines from top/bottom
global.termguicolors    = true      -- truecolor
-- global.t_Co             = "256"       -- enable 256 colors
global.guicursor        = ''        -- no cursor style (remain box)
window.signcolumn       = 'yes'
window.colorcolumn      = '80'

vim.cmd('set nohlsearch')

global.expandtab        = true      -- tabs -> spaces
buffer.expandtab        = true
global.tabstop          = 4         -- 1 tab = 4 spaces
buffer.tabstop          = 4
global.softtabstop      = 4
buffer.softtabstop      = 4
global.shiftwidth       = 4         -- 4 spaces when using < or >
buffer.shiftwidth       = 4
global.autoindent       = true      -- keep indentation on newlines
buffer.autoindent       = true
global.cindent          = true      -- automatic C program indenting
buffer.cindent          = true

global.swapfile         = false     -- dont generate swap files
buffer.swapfile         = false
global.backup           = false
global.writebackup      = false


-- split correctly
global.splitright       = true
global.splitbelow       = true

-- Not supported in neovim git
--[[ global.undofile         = true      -- persistent undo between sessions
buffer.undofile         = true ]]

-- comments dont continue onto next line when adding a newline in a comment
-- Overridden in /usr/local/Cellar/neovim/HEAD-4d1fc16/share/nvim/runtime/ftplugin/vim.vim and
-- /usr/local/Cellar/neovim/HEAD-4d1fc16/share/nvim/runtime/ftplugin/vim.lua. Had to edit those files
global.formatoptions = 'jcql'
buffer.formatoptions = 'jcql'

-- use system clipboard
global.clipboard = 'unnamed'

-- dont pass messages to |ins-completion-menu|
global.shortmess = global.shortmess..'c'

-- autocomplete options
global.completeopt = 'menuone,noinsert,noselect'


vim.g.python3_host_prog = os.getenv("PYTHON")
