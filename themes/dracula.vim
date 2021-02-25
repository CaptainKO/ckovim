let g:dracula_colorterm = 0

if (has("termguicolors"))
    set termguicolors
endif

if !exists('g:vscode')
    colorscheme dracula
endif

