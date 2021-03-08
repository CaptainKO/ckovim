" This makes the time before it updates your hover faster, other
set updatetime=300

" This makes it so that you can click a variable and a float window pops up
" augroup Coc
"     autocmd!
"     autocmd  CursorHold *  :silent! CocActionAsync('doHover')
" augroup END
let g:python3_host_prog='/usr/bin/python3'
command! -nargs=0 Prettier :CocCommand prettier.formatFile
