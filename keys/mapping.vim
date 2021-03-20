" replace all is aliased to
nnoremap <leader>ss :%s//g<Left><Left>
nnoremap <leader>S yiw:%s/\<<C-r>"\>//g<left><left>
"""""""""""""""""""""""""""""""""""""
" Mappings configurations
"""""""""""""""""""""""""""""""""""""
nnoremap <silent><leader><leader><CR> o<esc>
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
" nnoremap <C-p> :GFiles<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><C-p> :History<CR>
nnoremap <Leader>pcf :Files <C-R>=expand('%:h')<CR><CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader><C-h> :sp<CR> :wincmd j <CR>
nnoremap <Leader><C-v> :vsp<CR> :wincmd l <CR>
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nmap <leader><C-j> :tabprevious<CR>
nmap <leader><C-k> :tabnext<CR>
nmap <leader><C-h> :bprevious<CR>
nmap <leader><C-l> :bNext<CR>
noremap <Leader>rp :resize 100<CR>
" nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <silent> <leader>zq :bd<CR>

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()
" COC Explorer
:nnoremap <C-n> :CocCommand explorer  <CR>
" GoTo code navigation.
"
" You can call the action jumpDefinition with a command as argument:

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>e[ <Plug>(coc-diagnostic-prev-error)
nmap <leader>e] <Plug>(coc-diagnostic-next-error)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent><leader>gvd :call CocAction('jumpDefinition', 'vsplit')<CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nmap <silent><leader>gtd :call CocAction('jumpDefinition', 'tabe')<CR>

" nmap <leader>g[ <Plug>(coc-diagnostic-prev)
" nmap <leader>g] <Plug>(coc-diagnostic-next)
" nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
" nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart<CR>
" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Sweet Sweet FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>
nmap <leader>gp :G push<CR>
nnoremap <leader>gb :GBranches<CR>
nnoremap <leader>gr :G rebase -i<CR>
nnoremap <leader>gss :G stash<CR>
nnoremap <leader>gsp :G stash pop<CR>

" Neard tree
" nnoremap <leader>n :NERDTreeFocus<CR>
" map <C-n> :NERDTreeToggle<CR>

" Commentary
map <C-_> gcc

" CocCo
nnoremap <silent><nowait> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
" beautify
" augroup  js_beautify
"     autocmd!
"     autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
"     autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
"     autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
"     autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
"     autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
" augroup END
" Highlight the symbol and its references when holding the cursor.
augroup holde_cursor_highlight
    autocmd!
    autocmd CursorHold * silent call CocActionAsync('highlight')
augroup END
" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Formatting selected code.
nnoremap <leader><C-i> :Format<CR>
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"Navigation by Tab
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)

" fzf
nnoremap <silent><leader><leader>T :Buffers<CR>
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call   CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call   CocAction('runCommand', 'editor.action.organizeImport')
" comment like vscode
nmap <silent><leader><C-i> :Format <CR>

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <C-p> <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fo <cmd>lua require('telescope.builtin').oldfiles()<CR>
nnoremap <leader>fc <cmd>lua require('cko.telescope').search_current_folders()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').grep_string()<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>fm <cmd>lua require('telescope').extensions.media_files.media_files()<CR>
" UndoTree
" nnoremap <F5> :UndotreeToggle<CR>

fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun
" Debugger remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dcb <Plug>VimspectorToggleConditionalBreakpoint

" <Plug>VimspectorStop
" <Plug>VimspectorPause
" <Plug>VimspectorAddFunctionBreakpoint
"Toggle Maximizer
nnoremap <leader>m :MaximizerToggle!<CR>

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

augroup trim_white_space
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Swap functions
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>wm :call MarkWindowSwap()<CR>
nmap <silent> <leader>ws :call DoWindowSwap()<CR>
