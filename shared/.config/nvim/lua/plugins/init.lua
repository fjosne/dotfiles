-- Install packer if not installed
local execute = vim.api.nvim_command
local fn = vim.fn

local home = os.getenv("HOME")
local install_path = fn.stdpath('data')..home..'/.local/share/nvim/site/pack/packer/start/'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function()
    use {'wbthomason/packer.nvim', opt = true}

    -- Git
    use {'TimUntersberger/neogit', 
        requires = {
            'nvim-lua/plenary.nvim',
            'sindrets/diffview.nvim',
            'kyazdani42/nvim-web-devicons', 
        },
    }
    use 'dinhhuy258/git.nvim' -- git blame

    -- parenthesis stuff
    use 'steelsojka/pears.nvim'
    use 'blackCauldron7/surround.nvim'

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    -- lsp
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'saadparwaiz1/cmp_luasnip', -- For snippets completion
            'hrsh7th/cmp-nvim-lsp',     -- For lsp completion
            'hrsh7th/cmp-buffer'        -- For buffer completion
        }
    }
    use 'onsails/lspkind-nvim'
    use 'glepnir/lspsaga.nvim'

    -- snippets
    use 'L3MON4D3/LuaSnip'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            -- extensions
            'nvim-telescope/telescope-fzy-native.nvim',
            'nvim-telescope/telescope-bibtex.nvim',
            'nvim-telescope/telescope-snippets.nvim',
            'tami5/sql.nvim',
            'nvim-telescope/telescope-cheat.nvim'
        }
    }

    use 'szw/vim-maximizer'
    use 'christoomey/vim-tmux-navigator'
    use 'numToStr/Comment.nvim'

    use {
        'lukas-reineke/indent-blankline.nvim',
        requires = {
            'Yggdroot/indentLine'
        }
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    use {
        'hoob3rt/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons',
            -- config = function() 
            --     require'nvim-web-devicons'.setup{default = true}
            -- end,
            opt = true
        }
    }

    -- Latex supoprt
    use 'lervag/vimtex'

    -- colorschemes
    use {
        'ellisonleao/gruvbox.nvim',
        requires = {'rktjmp/lush.nvim'}
    }
    use 'Mofiqul/dracula.nvim'
    use 'Th3Whit3Wolf/one-nvim'
    use 'sainnhe/gruvbox-material'

    -- hex colorizer
    use 'ap/vim-css-color'

    -- org mode
    use {
        'kristijanhusak/orgmode.nvim',
    }

    use {
        'github/copilot.vim',
        tag = 'neovim-nightlies'
    }

end)
