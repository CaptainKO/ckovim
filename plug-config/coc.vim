" This makes the time before it updates your hover faster, other
set updatetime=300

" This makes it so that you can click a variable and a float window pops up
" augroup Coc
"     autocmd!
"     autocmd  CursorHold *  :silent! CocActionAsync('doHover')
" augroup END
let g:python3_host_prog='/usr/bin/python3'
command! -nargs=0 Prettier :CocCommand prettier.formatFile


" let g:coc_explorer_global_presets = {
" \   '.vim': {
" \     'root-uri': '~/.vim',
" \   },
" \   'cocConfig': {
" \      'root-uri': '~/.config/coc',
" \   },
" \   'tab': {
" \     'position': 'tab',
" \     'quit-on-open': v:true,
" \   },
" \   'floating': {
" \     'position': 'floating',
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'floatingTop': {
" \     'position': 'floating',
" \     'floating-position': 'center-top',
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'floatingLeftside': {
" \     'position': 'floating',
" \     'floating-position': 'left-center',
" \     'floating-width': 50,
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'floatingRightside': {
" \     'position': 'floating',
" \     'floating-position': 'right-center',
" \     'floating-width': 50,
" \     'open-action-strategy': 'sourceWindow',
" \   },
" \   'simplify': {
" \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
" \   },
" \   'buffer': {
" \     'sources': [{'name': 'buffer', 'expand': v:true}]
" \   },
" \ }

" nnoremap <Leader>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

" " Use preset argument to open it
" nnoremap <leader>ed :CocCommand explorer --preset .vim<CR>
" nnoremap <leader>ef :CocCommand explorer --preset floating<CR>
" nnoremap <leader>ec :CocCommand explorer --preset cocConfig<CR>
" nnoremap <leader>eb :CocCommand explorer --preset buffer<CR>

" " List all presets
" nnoremap <space>el :CocList explPresets<CR>
