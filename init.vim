" load local vimrc
source $HOME/.config/nvim/vim-plug/plugs.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/utils/tools.vim
source $HOME/.config/nvim/keys/mapping.vim
source $HOME/.config/nvim/themes/dracula.vim
source $HOME/.config/nvim/plug-config/.vim


" NeoBundle
" Required:
"set runtimepath+=~/.config/nvim/bundle/neobundle.vim/

" Required:
"call neobundle#begin(expand('~/.config/nvim/bundle'))
" Required
"NeoBundleFetch 'Shougo/neobundle.vim'
"NeoBundle 'tiagofumo/vim-nerdtree-syntax-highlight'
"call neobundle#end()
"filetype plugin indent on

" -- customize theme
" Disable arrow movement, resize splits instead.
"if get(g:, 'elite_mode')
"    nnoremap <C-Up>    :resize -2<CR>
"    nnoremap <C-Down>  :resize +2<CR>
"    nnoremap <Left>  :vertical resize -2<CR>
"    nnoremap <Right> :vertical resize +2<CR>
"endif
