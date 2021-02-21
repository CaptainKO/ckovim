source $HOME/.config/nvim/plug-config/coc.vim

if !exists('g:vscode')
    if (PlugLoaded('nerdtree'))
        source $HOME/.config/nvim/plug-config/nerd-tree.vim
    endif

    if (PlugLoaded('vim-polyglot'))
        source $HOME/.config/nvim/plug-config/polyglot.vim
    endif

    if (PlugLoaded('lightline.vim'))
        source $HOME/.config/nvim/plug-config/lightline.vim
    endif

    if (PlugLoaded('vim-rooter'))
        source $HOME/.config/nvim/plug-config/rooter.vim
    endif

    if (PlugLoaded('undotree'))
        source $HOME/.config/nvim/plug-config/undo-tree.vim
    endif

    if(PlugLoaded('emmet-vim'))
        source $HOME/.config/nvim/plug-config/emmet.vim
    endif


endif

