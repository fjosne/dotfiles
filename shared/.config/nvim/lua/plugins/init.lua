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
    ---- tpope
    use 'tpope/vim-fugitive'
    use 'tpope/vim-repeat'

    use 'windwp/nvim-autopairs'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/lsp-status.nvim'
    use 'hrsh7th/nvim-compe'

    -- use 'ludovicchabant/vim-gutentags'
    -- snippets
    use 'SirVer/ultisnips'

    -- telescope.nvim requirements
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'

    -- telescope.nvim extensions
    use 'nvim-telescope/telescope-fzy-native.nvim'
    use 'nvim-telescope/telescope-bibtex.nvim'
    use 'nvim-telescope/telescope-snippets.nvim'
    use 'tami5/sql.nvim'
    use 'nvim-telescope/telescope-cheat.nvim'

    use 'szw/vim-maximizer'
    use 'christoomey/vim-tmux-navigator'

    use 'b3nj5m1n/kommentary'
    use 'justinmk/vim-sneak'

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
      },
    config = function()
        require('gitsigns').setup()
    end
    }

    use {
      'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require'customization.statusline' end,
        -- some optional icons
        requires = {'kyazdani42/nvim-web-devicons', 
            config = function() require'nvim-web-devicons'.setup{default = true} end,
            opt = true}
    }

    -- Latex supoprt
    use 'lervag/vimtex'

    -- colorschemes
    use 'gruvbox-community/gruvbox'
    use 'joshdick/onedark.vim'
    use 'dracula/vim'
    use 'arcticicestudio/nord-vim'
    use 'drewtempelmeyer/palenight.vim'
    use 'herrbischoff/cobalt2.vim'
    use 'ray-x/aurora'
    use 'Th3Whit3Wolf/one-nvim'
    use 'sainnhe/sonokai'
    use 'yonlu/omni.vim'
    use 'sainnhe/edge'
    use {'kyoz/purify',
        rtp = 'vim'
    }
    use 'ayu-theme/ayu-vim'

    -- hex colorizer
    use 'ap/vim-css-color'

    -- vim-wiki
    use 'vimwiki/vimwiki'

    end)