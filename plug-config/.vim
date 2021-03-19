source $HOME/.config/nvim/plug-config/coc.vim

if !exists('g:vscode')
    if (PlugLoaded('vim-airline'))
        source $HOME/.config/nvim/plug-config/airline.vim
    endif

    if (PlugLoaded('nerdtree'))
        source $HOME/.config/nvim/plug-config/nerd-tree.vim
    endif

    if (PlugLoaded('fzf.vim'))
        source $HOME/.config/nvim/plug-config/fzf.vim
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

    if(PlugLoaded('startify'))
        source $HOME/.config/nvim/plug-config/startify.vim
    endif

    if(PlugLoaded('vim-easymotion'))
        source $HOME/.config/nvim/plug-config/easymotion.vim
    endif

    if(PlugLoaded('telescope.nvim'))
        source $HOME/.config/nvim/plug-config/telescope.vim
    endif

    if(PlugLoaded('vimspector'))
        source $HOME/.config/nvim/plug-config/vimspector.vim
    endif

    if(PlugLoaded('vim-doge'))
        source $HOME/.config/nvim/plug-config/doge.vim
    endif
    " if(PlugLoaded('vim-maximizer'))
    "     source $HOME/.config/nvim/plug-config/
    " endif

endif

