let g:NERDTreeChDirMode = 2
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusConcealBrackets = 0
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

let NERDTreeShowLineNumbers=0

:autocmd FileType nerdtree set norelativenumber
" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
" autocmd vimenter * silent! lcd %:p:h
