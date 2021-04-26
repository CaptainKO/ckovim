--vim.cmd [[packadd packer.nvim]]

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua
-- vim.g.ale_disable_lsp = true

return require('packer').startup(function(use)
        use 'easymotion/vim-easymotion'		--Quickly navigate in buffer
        -- Utility
        -- Latex
        -- use ('lervag/vimtex')
        -- Resize
        use 'szw/vim-maximizer'
        -- Color hexan highlight
        use { 'rrethy/vim-hexokinase',  run = 'make hexokinase' }
	-- Auto indent
	use 'tpope/vim-sleuth'
        -- Indent Characters
        use 'Yggdroot/indentLine'
        -- sugar syntax for file editing
        -- use 'tpope/vim-eunuch'
        -- Editor config
        use 'editorconfig/editorconfig-vim'
        -- Starter for choose recent projects
        use 'mhinz/vim-startify'
        -- Change Root
        use 'airblade/vim-rooter'
        -- Status/tabline
        use 'vim-airline/vim-airline'
        -- Footer
        -- Plug 'itchyny/lightline.vim'
        -- Better comments
        use 'tpope/vim-commentary'
        -- Surround
        use 'tpope/vim-surround'
        -- Undo tree
        use 'mbbill/undotree'
        -- Change dates fast
        use 'tpope/vim-speeddating'
        -- Icons
        use {'kyazdani42/nvim-web-devicons', }
        -- Text navigation
        --Plug 'unblevable/quick-scope'
        --Plug 'majutsushi/tagbar'
        -- Plug 'preservim/nerdtree' |
        --     \ Plug 'Xuyuanp/nerdtree-git-plugin' |
        --     \ Plug 'scrooloose/nerdtree-project-plugin'

        use {'junegunn/fzf', run = fn['fzf#install']  }
        use 'junegunn/fzf.vim'
        use 'tpope/vim-dispatch'
        --Auto pairs for '(' '[' '{'
        use 'jiangmiao/auto-pairs'
        -- Programming
        -- Syntax highlighting
        -- let g:polyglot_disabled = ['graphql', 'typescript', 'javascript']
        -- Plug 'sheerun/vim-polyglot'
        use {'neoclide/coc.nvim', branch = 'release'}
        -- golang
        use {'fatih/vim-go', run = ':GoInstallBinaries' }
        -- dart
        use 'dart-lang/dart-vim-plugin'

        -- Document Generators
        use {'kkoomen/vim-doge', run = fn['doge#install']  }

        -- Formatter
        use 'sbdchd/neoformat'
        -- Plug 'maksimr/vim-jsbeautify'
        -- Autocomplete
        -- Plug 'valloric/youcompleteme'
        -- Frontend
        -- html
        use 'othree/html5.vim'
        use  'Valloric/MatchTagAlways'
        -- Quick type html
        use 'mattn/emmet-vim'
        -- Modifies tags
        use 'AndrewRadev/tagalong.vim'
        -- Javascript
        -- Plug 'pangloss/vim-javascript'
        -- Typescript
        use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}  -- We recommend updating the parsers on update
        -- Lua
        use 'tjdevries/nlua.nvim'
        -- Databases
        use 'martingms/vipsql'
        -- Plug 'leafgarland/typescript-vim'
        -- Plug 'peitalin/vim-jsx-typescript'
        -- Syntax supports
        -- Plug 'HerringtonDarkholme/yats.vim'
        -- Git Support
        use 'tpope/vim-fugitive'
	use {
		'rbong/vim-flog',
		requires = {{ 'tpope/vim-fugitive' }}
        }
        use 'gisphm/vim-gitignore'
        use 'airblade/vim-gitgutter'
        use 'stsewd/fzf-checkout.vim'
        use {
            'ThePrimeagen/git-worktree.nvim',
            requires = { 'nvim-lua/plenary.nvim' }
        }


        use {
            'nvim-telescope/telescope.nvim',
            requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' }
        }
	use {
		'nvim-telescope/telescope-media-files.nvim',
		requires = {{ 'nvim-telescope/telescope.nvim' } }
        }
	use {
		'nvim-telescope/telescope-fzy-native.nvim',
		requires = {{'nvim-telescope/telescope.nvim' } }
        }
        use 'svermeulen/vimpeccable'
        --Plug 'vwxyutarooo/nerdtree-devicons-syntax'
        -- Debugger
        use 'puremourning/vimspector'


        -- Theme
        use {'dracula/vim',  as = 'dracula' }
        use 'gruvbox-community/gruvbox'
        -- Plug 'sainnhe/gruvbox-material'

        -- Tutorials
        use 'ThePrimeagen/vim-be-good'
        -- Plug 'rktjmp/lush.nvim' " required
        --Plug 'tweekmonster/gofmt.vim'
        --Plug 'tpope/vim-fugitive'
        --Plug 'vim-utils/vim-man'
        --Plug 'sheerun/vim-polyglot'
        --Plug 'vuciv/vim-bujo'
        --Plug 'leafgarland/typescript-vim'
        --Plug 'git@github.com:kien/ctrlp.vim.git'
        --Plug 'git@github.com:Valloric/YouCompleteMe.git'

end)
