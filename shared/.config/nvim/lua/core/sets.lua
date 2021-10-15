-- example how to remove substring from variable
-- set.indentkeys = set.indentkeys - {"<:>"}
-- set.indentkeys = set.indentkeys - {":"}

local set = vim.opt

set.errorbells          = false     	-- no audible error bells
set.ruler       	    = true      	-- add row and column info
set.relativenumber	    = true      	-- relative line numbers
set.number 		        = true      	-- add line numbers
set.wrap             	= false     	-- dont soft wrap lines when going off screen
set.hidden           	= true      	-- dont unload buffers when they're abandoned
set.incsearch        	= true      	-- incremental search results
set.cmdheight        	= 2         	-- increase size of cmd line
set.updatetime       	= 300       	-- faster update times (300ms)
set.scrolloff        	= 8         	-- start scroll when 8 lines from top/bottom
set.termguicolors    	= true      	-- truecolor
set.guicursor        	= ''        	-- no cursor style (remain box)
set.signcolumn       	= 'yes'
set.colorcolumn      	= '80'
set.hlsearch	     	= false		    -- only highlight current match

-- vim.cmd('set nohlsearch')

set.expandtab        	= true      	-- tabs -> spaces
set.tabstop          	= 4         	-- 1 tab = 4 spaces
set.shiftwidth       	= 4         	-- 4 spaces when using < or >
set.autoindent       	= false      	-- keep indentation on newlines
set.cindent          	= false      	-- automatic C program indenting

set.swapfile         	= false     	-- dont generate swap files
set.backup           	= false
set.writebackup      	= false


-- split correctly
set.splitright       	= true
set.splitbelow       	= true

set.undodir             = os.getenv("HOME") .. "/.vim/undodir"
set.undofile	     	= true	 	-- persistent undo between sessions
-- Not supported in neovim git
--[[ global.undofile         = true      
buffer.undofile         = true ]]

-- comments dont continue onto next line when adding a newline in a comment
-- Overridden in /usr/local/Cellar/neovim/HEAD-4d1fc16/share/nvim/runtime/ftplugin/vim.vim and
-- /usr/local/Cellar/neovim/HEAD-4d1fc16/share/nvim/runtime/ftplugin/vim.lua. Had to edit those files
set.formatoptions = 'jcql'

-- use system clipboard
set.clipboard = 'unnamedplus'

-- dont pass messages to |ins-completion-menu|
vim.o.shortmess = vim.o.shortmess..'c'

-- autocomplete options
set.completeopt = 'menuone,noinsert,noselect'

vim.g.python3_host_prog = vim.env.PYTHON
