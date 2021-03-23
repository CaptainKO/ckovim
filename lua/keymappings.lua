vim.g.mapleader =' '

local function t(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

vim.api.nvim_set_keymap('n', '<Leader>ss', ':%s//g<Left><Left>', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>S', 'yiw:%s/\\<<C-r>"\\>//g<Left><Left>"', { noremap = true })

vim.api.nvim_set_keymap('n', '<Leader>pw', ':Rg <C-R>=expand("<cword>")<CR><CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>phw', ':h <C-R>=expand("<cword>")<CR><CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>h', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>j', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>k', ':wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>l', ':wincmd l<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>u', ':UndoTreeShow<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>pv', ':wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>ps', ':Rg<SPACE>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader><CR>', 'luafile ~/.config/nvim/init.lua <CR>', {noremap = true})

-- splitting
vim.api.nvim_set_keymap('n', '<Leader><C-h>', ':sp<CR> :wincmd j <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader><C-v>', ':vsp<CR> :wincmd l <CR>', {noremap = true})

-- sizing
vim.api.nvim_set_keymap('n', '<Leader>=', ':vertical resize +5 <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>-', ':vertical resize -5 <CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>rp', ':resize 100 <CR>', {noremap = true})


-- switching
vim.api.nvim_set_keymap('n', '<Leader><Tab>', ':tabprevious<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader><S-Tab>', ':tabnext<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader><C-o>', ':bprevious<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader><C-i>', ':bNext<CR>', {})

-- visual mode
vim.api.nvim_set_keymap('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
vim.api.nvim_set_keymap('v', 'K', ':m \'>-2<CR>gv=gv', {noremap = true})

-- buffers
vim.api.nvim_set_keymap('n', '<Leader>zq', ':bd<CR>', {noremap = true, silent = true})

-- Coc

vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {})
vim.api.nvim_set_keymap('n', '<Leader>gd', '<Plug>(coc-definition)', {})

vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {})
vim.api.nvim_set_keymap('n', '<Leader>gy', '<Plug>(coc-type-definition)', {})

vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {})
vim.api.nvim_set_keymap('n', '<Leader>gi', '<Plug>(coc-implementation)', {})

vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {})
vim.api.nvim_set_keymap('n', '<Leader>gr', '<Plug>(coc-references)', {})

vim.api.nvim_set_keymap('n', '<Leader>rr', '<Plug>(coc-rename)', {})
vim.api.nvim_set_keymap('n', '<Leader>F2', '<Plug>(coc-rename)', {})
vim.api.nvim_set_keymap('n', '<Leader>e[', '<Plug>(coc-diagnostic-prev-error)', {})
vim.api.nvim_set_keymap('n', '<Leader>e]', '<Plug>(coc-diagnostic-next-error)', {})
vim.api.nvim_set_keymap('n', '<Leader>g[', '<Plug>(coc-diagnostic-prev)', {})
vim.api.nvim_set_keymap('n', '<Leader>g]', '<Plug>(coc-diagnostic-next)', {})
vim.api.nvim_set_keymap('n', '<Leader>ac', '<Plug>(coc-codeaction)', {})
vim.api.nvim_set_keymap('n', '<Leader>qf', '<Plug>(coc-fix-current)', {})
vim.api.nvim_set_keymap('n',
    '<Leader>gvd', '<cmd>call CocAction(\'jumpDefinition\', \'vsplit\')<CR>',
    { silent = true }
)
vim.api.nvim_set_keymap('n',
    '<Leader>gtd', '<cmd>call CocAction(\'jumpDefinition\', \'tabe\')<CR>',
    { silent = true }
)
vim.api.nvim_set_keymap('i', '<C-space>', '<cmd>call coc#refresh()<CR>', {noremap = true,  silent = true})
vim.api.nvim_set_keymap('n', '<Leader>prw', '<cmd>CocSearch <C-R>=expand("<cword>")<CR><CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>cr', '<cmd>CocRestart<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'K', ':call Show_documentation()<CR>', { noremap = true, nowait = true })

vim.cmd([[
function! Show_documentation()
    if(index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
]])

-- return vim.fn.pumvisible() == 1 and t'<C-n>' or t'<Tab>'
-- scroll in normalmode
function _G.scroll_down_no_doc()
    local scroll = vim.fn['coc#float#scroll']
    local hasScroll = vim.fn['coc#float#has_scroll']()

    return hasScroll == 1 and scroll(1) or t'<C-f>'
end

function _G.scroll_up_no_doc()
    local scroll = vim.fn['coc#float#scroll']
    local hasScroll = vim.fn['coc#float#has_scroll']()

    return hasScroll == 1 and scroll(0) or t'<C-b>'
end
-- scroll in insertmode
function _G.scoll_down_in_doc()
    local hasScroll = vim.fn['coc#float#has_scroll']()
    return hasScroll == 1 and t'<c-r>'..'=coc#float#scroll(1)'..t'<cr>' or t'<Right>'
end

function _G.scoll_up_in_doc()
    local hasScroll = vim.fn['coc#float#has_scroll']()
    return hasScroll == 1 and t'<c-r>'..'=coc#float#scroll(0)'..t'<cr>' or t'<Left>'
end
vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>CocCommand explorer <CR>', { noremap = true,  nowait = true})


-- Coc scroll inside popup
vim.api.nvim_set_keymap('n', '<Leader><C-f>', 'v:lua.scroll_down_no_doc()', { noremap = true, expr = true, nowait = true })
vim.api.nvim_set_keymap('n', '<Leader><C-b>', 'v:lua.scroll_up_no_doc()', { noremap = true, expr = true, nowait = true})
vim.api.nvim_set_keymap('i', '<C-f>', 'v:lua.scroll_down_in_doc()', { noremap = true, expr = true, nowait = true})
vim.api.nvim_set_keymap('i', '<C-b>', 'v:lua.scroll_up_in_doc()', { noremap = true, expr = true, nowait = true})
-- vim.api.nvim_set_keymap('n', '<Leader><C->', '<expr>', {noremap = true, nowait = true})

-- Sweet Sweet FuGITive
vim.api.nvim_set_keymap('n', '<Leader>gf', ':diffget //2<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gj', ':diffget //3<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gs', ':G<CR>', {})
vim.api.nvim_set_keymap('n', '<Leader>gp', ':G push<CR>', {})
-- vim.api.nvim_set_keymap('n', '<Leader>gb', ':GBranches<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gr', ':G rebase -i<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gsp', ':G stash pop', {noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>gss', ':G stash', { noremap = true })

-- Commentary
vim.api.nvim_set_keymap('', '<C-_>', 'gcc', {})

-- Format
vim.api.nvim_set_keymap('n', '<Leader><C-i>', '<cmd>Format<CR>' , { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>f', '<Plug>(coc-format-selected)', {})
vim.api.nvim_set_keymap('x', '<Leader>f', '<Plug>(coc-format-selected)', {})


-- Tab selection
vim.api.nvim_set_keymap('i', '<TAB>', 'v:lua.smart_tab()', {noremap = true, expr = true})
local function check_back_space()
   local col = vim.api.nvim_win_get_cursor(0)[2]
   return (col == 0) or vim.api.nvim_get_current_line():sub(col, col):match('%s') and true
end

function _G.CocRefresh()
   return vim.fn['coc#refresh']();
end
function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and vim.fn['coc#_select_confirm']()
        or vim.fn['coc#expandableOrJumpable']() and t'<C-r>'.. '=coc#rpc#request(\'doKeymap\', [\'snippets-expand-jump\',\'\'])'..t'<CR>'
        or check_back_space() and t'<TAB>' or  vim.fn['coc#refresh']()
end

vim.cmd([[ command! -nargs=0 Format :call CocAction('format') ]])
vim.cmd([[ command! -nargs=? Fold :call   CocAction('fold', <f-args>) ]])
vim.cmd([[ command! -nargs=0 OR   :call   CocAction('runCommand', 'editor.action.organizeImport') ]])

-- Telescope
vim.api.nvim_set_keymap('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd> lua require('telescope.builtin').git_files()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fo', [[<cmd> lua require('telescope.builtin').oldfiles()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fc', [[<cmd> lua require('telescope.builtin').search_current_folders()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fg', [[<cmd> lua require('telescope.builtin').grep_string()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fb', [[<cmd> lua require('telescope.builtin').buffers()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>fm', [[<cmd> lua require('telescope').extensions.media_files()<CR>]], {noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>gb', [[<cmd> lua require('cko.telescope').git_branches()<CR>]], {noremap = true})

vim.api.nvim_set_keymap('n', '<Leader>dd', [[<cmd> lua vim.fn['vimspector#Launch']() <CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>dc', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.code)<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>dt', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.tagpage)<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>dv', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.variables)<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>dw', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.watches)<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>ds', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.stack_trace)<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>do', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.output)<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>dr', [[<cmd>call vimspector#Reset()<CR>]], {noremap = true})

function _G.go_to_window(id)
   vim.fn.win_gotoid(id)
   vim.fn.MaximizerToggle()
end

vim.api.nvim_set_keymap('n', '<Leader>dtcb', [[<cmd> call vimspector#CleanLineBreakpoint()<CR>]], {noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>dl', [[<Plug>VimspectorStepInto]], {})
vim.api.nvim_set_keymap('n', '<Leader>dj', [[<Plug>VimspectorStepOver]], {})
vim.api.nvim_set_keymap('n', '<Leader>dk', [[<Plug>VimspectorStepOut]], {})
vim.api.nvim_set_keymap('n', '<Leader>d_', [[<Plug>VimspectorRestart]], {})
vim.api.nvim_set_keymap('n', '<Leader>drc', [[<Plug>VimspectorRunToCursor]], {})
vim.api.nvim_set_keymap('n', '<Leader>db', [[<Plug>VimspectorToggleBreakpoint]], {})
vim.api.nvim_set_keymap('n', '<Leader>dcb', [[<Plug>VimspectorToggleConditionalBreakpoint]], {})
vim.api.nvim_set_keymap('n', '<Leader>d<space>',[[<cmd>call vimspector#Continue()<CR>]], {noremap = true})

-- Toggle Maximizer
vim.api.nvim_set_keymap('n', '<Leader>m', [[<cmd> MaximizerToggle!<CR>]], {noremap = true})

vim.cmd([[
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun
]])

vim.cmd('augroup trim_white_space')
vim.cmd('autocmd!')
vim.cmd('autocmd BufWritePre * :call TrimWhitespace()')
vim.cmd('augroup END')

-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {})
