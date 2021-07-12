--vim.cmd [[packadd packer.nvim]]

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
    execute 'packadd packer.nvim'
end

-- vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua
-- vim.g.ale_disable_lsp = true

return require('packer').startup(function(use)
  -- use 'easymotion/vim-easymotion'  --Quickly navigate in buffer
  -- Utility
  -- auto load local .vimrc files
  -- use 'krisajenkins/vim-projectlocal'
  -- Latex
  -- use ('lervag/vimtex')
  -- Resize
  -- use 'szw/vim-maximizer'
  -- Color hexan highlight
  use { 'norcalli/nvim-colorizer.lua' }
  -- Auto indent
  use 'tpope/vim-sleuth'
  -- Indent Characters
  -- use 'Yggdroot/indentLine'
  -- sugar syntax for file editing
  -- use 'tpope/vim-eunuch'
  -- Todo
  use 'dhruvasagar/vim-dotoo'
  -- Editor config
  use 'editorconfig/editorconfig-vim'
  -- Starter for choose recent projects
  use 'mhinz/vim-startify'
  -- Change Root
  use 'airblade/vim-rooter'
  -- Status/tabline
  use 'vim-airline/vim-airline'
  -- Harpoon
  -- use { 'ThePrimeagen/harpoon' }
  -- Footer
  -- Plug 'itchyny/lightline.vim'
  -- Better comments
  use 'tpope/vim-commentary'
  -- Surround
  use 'tpope/vim-surround'
  -- Undo tree
  use 'mbbill/undotree'
  -- Change dates fast
  -- use 'tpope/vim-speeddating'
  -- Text navigation
  --Plug 'unblevable/quick-scope'
  -- Icons
  use {'kyazdani42/nvim-web-devicons', }
  --Plug 'majutsushi/tagbar'
  -- use 'kyazdani42/nvim-tree.lua'

  -- Plug 'preservim/nerdtree' |
  --     \ Plug 'Xuyuanp/nerdtree-git-plugin' |
  --     \ Plug 'scrooloose/nerdtree-project-plugin'

  -- use { 'junegunn/fzf', run = fn['fzf#install']  }
  -- use 'junegunn/fzf.vim'
  use 'tpope/vim-dispatch'
  --Auto pairs for '(' '[' '{'
  -- use {'windwp/nvim-autopairs', config = function ()
  --   require('nvim-autopairs').setup();
  -- end}
  use 'jiangmiao/auto-pairs'
  -- Programming
  -- Syntax highlighting
  -- let g:polyglot_disabled = ['graphql', 'typescript', 'javascript']
  --
  use 'jparise/vim-graphql'
  if vim.g.use_lsp then
    use {'neovim/nvim-lspconfig'}
    use {'kabouzeid/nvim-lspinstall'}
    use {'hrsh7th/vim-vsnip'}
    -- use {'hrsh7th/nvim-compe'}
    use {'glepnir/lspsaga.nvim'}
    -- use 'prabirshrestha/vim-lsp'
    -- use 'mattn/vim-lsp-settings'
  end
  -- Snippets
  use {'honza/vim-snippets'}
  --
  -- use {'nvim-lua/completion-nvim'}
  -- Plug 'sheerun/vim-polyglot'
  -- vim lsp
  -- if not vim.g.use_lsp then

  -- end
  use { 'neoclide/coc.nvim', branch = 'release'}
  use {'yaegassy/coc-jsdoc', run= 'yarn install --frozen-lockfile'}
  -- golang
  use { 'fatih/vim-go', run = ':GoInstallBinaries' }
  -- dart
  -- use 'dart-lang/dart-vim-plugin'

  -- Document Generators
  use {'kkoomen/vim-doge', run = fn['doge#install']  }

  -- Formatter
  -- use 'sbdchd/neoformat'
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
  -- use { 'windwp/nvim-ts-autotag',
  --   config = function ()
  --     require('nvim-ts-autotag').setup()
  --   end
  -- }
  use 'AndrewRadev/tagalong.vim'
  -- Javascript
  -- Plug 'pangloss/vim-javascript'
  -- Typescript
  use {'FuDesign2008/json2ts.vim', run = 'npm install'  }
  -- use 'HerringtonDarkholme/yats.vim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}  -- We recommend updating the parsers on update
  -- use { 'nvim-treesitter/playground', }  -- We recommend updating the parsers on update
  use { 'p00f/nvim-ts-rainbow' }
  -- Angular
  use { 'nvim-treesitter/nvim-treesitter-angular' }
  -- Lua
  use 'tjdevries/nlua.nvim'
  -- AutoLoad lua files
  use 'tjdevries/astronauta.nvim'
  -- Database
  use { 'kristijanhusak/vim-dadbod-ui', requires = { 'tpope/vim-dadbod' }}
  -- Syntax supports
  -- Plug 'HerringtonDarkholme/yats.vim'
  -- Git Support
  use 'tpope/vim-fugitive'
  use { 'rbong/vim-flog' }
  use 'gisphm/vim-gitignore'
  use 'airblade/vim-gitgutter'
  -- Git Blame
  -- use 'zivyangll/git-blame.vim'
  -- use 'APZelos/blamer.nvim'

  -- use 'stsewd/fzf-checkout.vim'
  use { 'ThePrimeagen/git-worktree.nvim', }


  use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
  }
  use { 'nvim-telescope/telescope-media-files.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use 'fannheyward/telescope-coc.nvim'
  -- use 'svermeulen/vimpeccable'
  --Plug 'vwxyutarooo/nerdtree-devicons-syntax'
  -- Debugger
  use 'puremourning/vimspector'


  --
  use 'chr4/nginx.vim'
  -- Theme
  -- use {'dracula/vim',  as = 'dracula' }
  -- use 'gruvbox-community/gruvbox'
  use { 'sainnhe/gruvbox-material' }

  -- Tutorials
  -- use 'ThePrimeagen/vim-be-good'
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
