call plug#begin('~/.config/nvim/autoload/plugged')
   if exists('g:vscode')
        " Easy motion for VSCode
        " Plug 'asvetliakov/vim-easymotion'
        "Plug 'ChristianChiarulli/vscode-easymotion'
        "Plug 'machakann/vim-highlightedyank'
   else
        " Utility
        "
        " Footer
        Plug 'itchyny/lightline.vim'
        " Better comments
        Plug 'tpope/vim-commentary'
        " Change dates fast
        Plug 'tpope/vim-speeddating'
        " Text navigation
        "Plug 'unblevable/quick-scope'
        "Plug 'majutsushi/tagbar'
        Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'tpope/vim-dispatch'
        "Auto pairs for '(' '[' '{'
        Plug 'jiangmiao/auto-pairs'
        " Programming
        " Syntax highlighting
        Plug 'sheerun/vim-polyglot'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " Git Support
        Plug 'tpope/vim-fugitive'
        Plug 'gisphm/vim-gitignore'


        " Vim Nerd Tree Git
        Plug 'ryanoasis/vim-devicons'

        "Plug 'vwxyutarooo/nerdtree-devicons-syntax'


        " Theme
        Plug 'dracula/vim', { 'as': 'dracula' }
        "Plug 'tweekmonster/gofmt.vim'
        "Plug 'tpope/vim-fugitive'
        "Plug 'vim-utils/vim-man'
        "Plug 'mbbill/undotree'
        "Plug 'sheerun/vim-polyglot'
        "Plug 'vuciv/vim-bujo'
        "Plug 'leafgarland/typescript-vim'
        "Plug 'git@github.com:kien/ctrlp.vim.git'
        "Plug 'git@github.com:Valloric/YouCompleteMe.git'
    endif
call plug#end()

