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

let g:NERDTreeShowLineNumbers=0
let g:NERDTreeWinPos='right'
let g:NERDTreeWinSize=40


" autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
"autocmd vimenter * silent! lcd %:p:h
