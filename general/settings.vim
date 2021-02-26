"filetype plugin on
set exrc
set secure
" set line numbers
" set number
" set relative line numbers
set cursorline
set number relativenumber
let ftToIgnore = ['nerdtree', 'fzf']
" auto switch number and relative number

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * if index(ftToIgnore, &ft) <0 | set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * if index(ftToIgnore, &ft) <0 | set norelativenumber
augroup END


" use cliboard for copy/past
set clipboard^=unnamedplus,unnamed
" no highlight in search mode"
set nohlsearch

" vim for coding
syntax on
set autochdir
set encoding=UTF-8
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set ignorecase
set smartcase
set nowrap
set noswapfile
set nobackup
" set undodir=~/.config/nvim/undodir
" set undofile
set incsearch
set scrolloff=8
let g:elite_mode=1

" if exists('+termguicolors')
"   set termguicolors
" endif
if &compatible
  set nocompatible               " Be iMproved
endif

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

let loaded_matchparen = 1
let mapleader = " "

