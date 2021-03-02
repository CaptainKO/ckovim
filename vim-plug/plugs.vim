call plug#begin('~/.config/nvim/autoload/plugged')
        " Quickly navigate in buffer
        Plug 'easymotion/vim-easymotion'
   if exists('g:vscode')
        " Easy motion for VSCode
        " Plug 'asvetliakov/vim-easymotion'
        "Plug 'ChristianChiarulli/vscode-easymotion'
        "Plug 'machakann/vim-highlightedyank'
   else
        " Utility
        " Auto indent
        Plug 'tpope/vim-sleuth'
        " Editor config
        Plug 'editorconfig/editorconfig-vim'
        " Starter for choose recent projects
        Plug 'mhinz/vim-startify'
        " Change Root
        Plug 'airblade/vim-rooter'
        " Status/tabline
        Plug 'vim-airline/vim-airline'
        " Footer
        " Plug 'itchyny/lightline.vim'
        " Better comments
        Plug 'tpope/vim-commentary'
        " Surround
        Plug 'tpope/vim-surround'
        " Undo tree
        Plug 'mbbill/undotree'
        " Change dates fast
        Plug 'tpope/vim-speeddating'
        " Icons
        Plug 'ryanoasis/vim-devicons'
        " Text navigation
        "Plug 'unblevable/quick-scope'
        "Plug 'majutsushi/tagbar'
        Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'scrooloose/nerdtree-project-plugin'

        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-dispatch'
        "Auto pairs for '(' '[' '{'
        Plug 'jiangmiao/auto-pairs'
        " Programming
        " Syntax highlighting
        " let g:polyglot_disabled = ['graphql', 'typescript', 'javascript']
        " Plug 'sheerun/vim-polyglot'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " Formatter
        Plug 'sbdchd/neoformat'
        " Plug 'maksimr/vim-jsbeautify'
        " Autocomplete
        " Plug 'valloric/youcompleteme'
        " Frontend
        " html
        Plug 'othree/html5.vim'
        " Quick type html
        Plug 'mattn/emmet-vim'
        " Modifies tags
        Plug 'AndrewRadev/tagalong.vim'
        " Javascript
        " Plug 'pangloss/vim-javascript'
        " Typescript
        Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
        " Plug 'leafgarland/typescript-vim'
        " Plug 'peitalin/vim-jsx-typescript'
        " Syntax supports
        " Plug 'HerringtonDarkholme/yats.vim'
        " Git Support
        Plug 'tpope/vim-fugitive'
        Plug 'gisphm/vim-gitignore'
        Plug 'airblade/vim-gitgutter'
        Plug 'stsewd/fzf-checkout.vim'

        Plug 'nvim-lua/popup.nvim'
        Plug 'nvim-lua/plenary.nvim'
        Plug 'nvim-telescope/telescope.nvim'  |
           \ Plug 'nvim-telescope/telescope-media-files.nvim'
        "Plug 'vwxyutarooo/nerdtree-devicons-syntax'


        " Theme
        Plug 'dracula/vim', { 'as': 'dracula' }
        Plug 'gruvbox-community/gruvbox'
        " Plug 'rktjmp/lush.nvim' " required
        "Plug 'tweekmonster/gofmt.vim'
        "Plug 'tpope/vim-fugitive'
        "Plug 'vim-utils/vim-man'
        "Plug 'sheerun/vim-polyglot'
        "Plug 'vuciv/vim-bujo'
        "Plug 'leafgarland/typescript-vim'
        "Plug 'git@github.com:kien/ctrlp.vim.git'
        "Plug 'git@github.com:Valloric/YouCompleteMe.git'
    endif
call plug#end()

