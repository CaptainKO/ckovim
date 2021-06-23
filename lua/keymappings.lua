local M = { }
vim.g.mapleader =' '
local bind_key = vim.api.nvim_set_keymap;
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
function M.toggle_tab()
  vim.b.expandtab = vim.b.expandtab == false
  print(vim.b.expandtab)
end

bind_key('n', '<Leader>bca', '<cmd>%bdelete|edit #|normal `" <CR>', {noremap =true})
-- bind_key('i', '<C-BS>', t'<Z-w>', {noremap=true,silent=true})

-- bind_key('n', '<Leader>ss', ':%s//g<Left><Left>', { noremap = true })

-- bind_key('n', '<Leader>S', 'yiw:%s/\\<<C-r>"\\>//g<Left><Left>"', { noremap = true })

-- bind_key('n', '<Leader>pw', ':Rg <C-R>=expand("<cword>")<CR><CR>', { noremap = true })
-- bind_key('n', '<Leader>phw', ':h <C-R>=expand("<cword>")<CR><CR>', { noremap = true })
bind_key('n', '<Leader>h', ':wincmd h<CR>', { noremap = true, silent = true })
bind_key('n', '<Leader>hh', ':wincmd h<CR>', { noremap = true, silent = true })
bind_key('n', '<Leader>j', ':wincmd j<CR>', { noremap = true, silent = true })
bind_key('n', '<Leader>k', ':wincmd k<CR>', { noremap = true, silent = true })
bind_key('n', '<Leader>l', ':wincmd l<CR>', { noremap = true, silent = true })

bind_key('t', '<Leader>h', '<C-\\><C-N><C-w>h', { noremap = true, silent = true })
bind_key('t', '<Leader>j', '<C-\\><C-N><C-w>j', { noremap = true, silent = true })
bind_key('t', '<Leader>k', '<C-\\><C-N><C-w>k', { noremap = true, silent = true })
bind_key('t', '<Leader>l', '<C-\\><C-N><C-w>l', { noremap = true, silent = true })

-- bind_key('n', '<Leader>u', ':UndoTreeShow<CR>', { noremap = true })
bind_key('n', '<Leader>ut', "<CMD>lua require('keymappings').toggle_tab()<CR>", { noremap = true })
bind_key('n', '<Leader>pv', ':wincmd v<bar> :Ex <bar> :vertical resize 30 <CR>', { noremap = true })
bind_key('n', '<Leader>ps', ':Rg<SPACE>', {noremap = true})
bind_key('n', '<Leader><CR>', 'luafile ~/.config/nvim/init.lua <CR>', {noremap = true})

-- splitting
bind_key('n', '<Leader><C-h>', ':sp<CR> :wincmd j <CR>', {noremap = true})
bind_key('n', '<Leader><C-v>', ':vsp<CR> :wincmd l <CR>', {noremap = true})

-- sizing
bind_key('n', '<Leader>=', ':vertical resize +5 <CR>', {noremap = true})
bind_key('n', '<Leader>-', ':vertical resize -5 <CR>', {noremap = true})
bind_key('n', '<Leader>rp', ':resize 100 <CR>', {noremap = true})


-- switching
bind_key('n', '<Leader><Tab>', ':tabprevious<CR>', {noremap = true})
bind_key('n', '<Leader><S-Tab>', ':tabnext<CR>', {noremap = true})
bind_key('n', '<Leader><C-o>', ':bnext<CR>', {noremap = true})
bind_key('n', '<Leader><C-i>', ':bprev<CR>', {noremap = true})

-- quick fix
bind_key('n', '<c-j>' , '<cmd>cn<CR>', {noremap = true, nowait=true})
bind_key('n', '<c-k>' , '<cmd>cp<CR>', {noremap = true, nowait=true})

-- visual mode
bind_key('v', 'J', ':m \'>+1<CR>gv=gv', {noremap = true})
bind_key('v', 'K', ':m \'>-2<CR>gv=gv', {noremap = true})

-- buffers
bind_key('n', '<Leader>zq', ':bd<CR>', {noremap = true, silent = true})

-- vim-tree
-- bind_key('n', '<Leader><c-n>', '<cmd>NvimTreeToggle<CR>', {noremap = true})
-- Harpoon

bind_key('n', '<Leader>ha', '<cmd> lua require("harpoon.mark").add_file()<CR>', {noremap =true})
-- TreeSitter
bind_key('n', '<Leader>th', ':TSBufToggle highlight<CR>', {noremap = true, silent = true})

-- Coc
if not vim.g.use_lsp then
  bind_key('x', 'af', '<Plug>(coc-funcobj-a)', {})
  bind_key('o', 'af', '<Plug>(coc-funcobj-a)', {})

  bind_key('x', 'if', '<Plug>(coc-funcobj-i)', {})
  bind_key('o', 'if', '<Plug>(coc-funcobj-i)', {})

  bind_key('x', 'ac', '<Plug>(coc-classobj-a)', {})
  bind_key('o', 'ac', '<Plug>(coc-classobj-a)', {})

  bind_key('x', 'ic', '<Plug>(coc-classobj-i)', {})
  bind_key('o', 'ic', '<Plug>(coc-classobj-i)', {})

  bind_key('n', 'go', '<cmd>CocList outline<CR>', {})
  bind_key('n', '<Leader>go', '<cmd>CocList outline<CR>', {})

  bind_key('n', 'gd', '<Plug>(coc-definition)', {})
  bind_key('n', '<Leader>gd', '<Plug>(coc-definition)', {})

  bind_key('n', 'gy', '<Plug>(coc-type-definition)', {})
  bind_key('n', '<Leader>gy', '<Plug>(coc-type-definition)', {})

  bind_key('n', 'gi', '<Plug>(coc-implementation)', {})
  bind_key('n', '<Leader>gi', '<Plug>(coc-implementation)', {})

  bind_key('n', 'gr', '<Plug>(coc-references)', {})
  bind_key('n', '<Leader>gr', '<Plug>(coc-references)', {})

  bind_key('n', 'gl', '<Plug>(coc-references)', {})
  bind_key('n', '<Leader>gl', '<Plug>(coc-references)', {})

  bind_key('n', '<Leader>rr', '<Plug>(coc-rename)', {})
  bind_key('n', '<Leader>F2', '<Plug>(coc-rename)', {})
  bind_key('n', '<Leader>e[', '<Plug>(coc-diagnostic-prev-error)', {})
  bind_key('n', '<Leader>e]', '<Plug>(coc-diagnostic-next-error)', {})
  bind_key('n', '<Leader>g[', '<Plug>(coc-diagnostic-prev)', {})
  bind_key('n', '<Leader>g]', '<Plug>(coc-diagnostic-next)', {})
  bind_key('n', '<Leader>ac', '<Plug>(coc-codeaction)', {})
  bind_key('n', '<Leader>qf', '<Plug>(coc-fix-current)', {})
  bind_key('n',
     '<Leader>gvd', '<cmd>call CocAction(\'jumpDefinition\', \'vsplit\')<CR>',
     { silent = true }
  )
  bind_key('n',
     '<Leader>gtd', '<cmd>call CocAction(\'jumpDefinition\', \'tabe\')<CR>',
     { silent = true }
  )
  bind_key('i', '<C-space>', '<cmd>call coc#refresh()<CR>', {noremap = true, silent = true})
  bind_key('n', '<Leader>prw', '<cmd>CocSearch <C-R>=expand("<cword>")<CR><CR>', { noremap = true })
  bind_key('n', '<Leader><Leader>cr', '<cmd>CocRestart<CR>', { noremap = true })
  bind_key('n', 'K', ':call Show_documentation()<CR>', { noremap = true, nowait = true })

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
  function _G.scroll_down_in_doc()
    local hasScroll = vim.fn['coc#float#has_scroll']()
    return hasScroll == 1 and t('<c-r>')..'=coc#float#scroll(1)'..t('<cr>') or t('<Right>')

  end

  function _G.scroll_up_in_doc()
    local hasScroll = vim.fn['coc#float#has_scroll']()
    return hasScroll == 1 and t('<c-r>')..'=coc#float#scroll(0)'..t('<cr>') or t('<Left>')
  end


  -- Coc scroll inside popup
  bind_key('n', '<C-f>', 'v:lua.scroll_down_no_doc()', { noremap = true, expr = true, nowait = true })
  bind_key('n', '<C-b>', 'v:lua.scroll_up_no_doc()', { noremap = true, expr = true, nowait = true})
  bind_key('i', '<C-f>', 'v:lua.scroll_down_in_doc()', { noremap = true, expr = true, nowait = true})
  bind_key('i', '<C-b>', 'v:lua.scroll_up_in_doc()', { noremap = true, expr = true, nowait = true})
  -- vim.api.nvim_set_keymap('n', '<Leader><C->', '<expr>', {noremap = true, nowait = true})
  vim.cmd([[ command! -nargs=0 Format :call CocAction('format') ]])
  vim.cmd([[ command! -nargs=? Fold :call   CocAction('fold', <f-args>) ]])
  vim.cmd([[ command! -nargs=0 OR   :call   CocAction('runCommand', 'editor.action.organizeImport') ]])

  bind_key('n', '<Leader><Leader><C-i>', '<cmd>Format<CR>' , { noremap = true })
  bind_key('n', '<Leader>f', '<Plug>(coc-format-selected)', {})
  bind_key('x', '<Leader>f', '<Plug>(coc-format-selected)', {})

  bind_key('i', '<TAB>', 'v:lua.smart_tab()', {noremap = true, expr = true})
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
       or t'<TAB>'
       -- or check_back_space() and t'<TAB>' or  vim.fn['coc#refresh']()
  end
end
bind_key('n', '<C-n>', '<cmd>CocCommand explorer <CR>', { noremap = true,  nowait = true})

if vim.g.use_lsp then
   bind_key('n', '<leader><leader>f', "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true })
   bind_key('v', '<leader><leader>f', "<cmd>lua vim.lsp.buf.range_formatting()<CR>", {noremap = true})
   -- bind_key('n', '<leader>ac', "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
   -- bind_key('v', '<leader>ac', "<cmd>lua vim.lsp.buf.range_code_action()<CR>", {noremap = true})
   bind_key('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap= true, silent=true});
   bind_key('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {noremap= true, silent=true});
   bind_key('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {noremap= true, silent=true});
   bind_key('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {noremap= true, silent=true});
   bind_key('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap= true, silent=true});
   bind_key('n', '<Leader><c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {noremap= true, silent=true});
   bind_key('n', '<Leader>g]', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {noremap= true, silent=true});
   bind_key('n', '<Leader>g[', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {noremap= true, silent=true});
   _G.s_tab_complete = function()
     if vim.fn.pumvisible() == 1 then
          return t "<C-p>"
        elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
          return t "<Plug>(vsnip-jump-prev)"
        else
          return t "<S-Tab>"
        end
   end

   _G.tab_complete = function()
     if vim.fn.pumvisible() == 1 then
          return t "<C-n>"
        elseif vim.fn.call("vsnip#jumpable", {1}) == 1 then
          return t "<Plug>(vsnip-jump-next)"
        else
          return t "<Tab>"
        end
   end
   bind_key("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
   bind_key("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
   bind_key("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
   bind_key("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

  -- Nvim Compe




  -- bind_key("i", "<C-space>", "<cmd>call compe#complete()<CR>", {noremap = true, expr = true, silent = true})
  -- bind_key("i", "<CR>", "<cmd>call compe#confirm('<CR>')<CR>", {noremap = true, expr = true, silent = true})
  -- bind_key("i", "<C-e>", "<cmd>call compe#close('<C-e>')<CR>", {noremap = true, expr = true, silent = true})
  -- bind_key("i", "<C-f>", "call compe#scroll({ 'delta': +4 })", {noremap = true, expr = true, silent = true})
  -- bind_key("i", "<C-d>", "call compe#scroll({ 'delta': -4 })", {noremap = true, expr = true, silent = true})

  -- lsp saga
  bind_key('n', '<leader>ac', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {noremap=true, silent = true})
  bind_key('v', '<leader>ac', "<cmd>lua require('lspsaga.codeaction').range_code_action()<CR>", {noremap=true, silent = true})
  bind_key('n', '<leader>rr', "<cmd>lua require('lspsaga.rename').rename()<CR>", {noremap=true, silent = true})

end -- endif lsp

-- Sweet Sweet FuGITive
bind_key('n', '<Leader>gf', ':diffget //2<CR>', {})
bind_key('n', '<Leader>gj', ':diffget //3<CR>', {})
bind_key('n', '<Leader>gs', ':G<CR>', {})
bind_key('n', '<Leader>gp', ':G push<CR>', {})
-- vim.api.nvim_set_keymap('n', '<Leader>gb', ':GBranches<CR>', { noremap = true })
bind_key('n', '<Leader>gr', ':G rebase -i<CR>', { noremap = true })
bind_key('n', '<Leader>gsp', ':G stash pop', {noremap = true })
bind_key('n', '<Leader>gss', ':G stash', { noremap = true })
-- Git Blame
bind_key('n', '<Leader><C-u>', ':call gitblame#echo()<CR>', { noremap = true })

-- Commentary
bind_key('', '<C-_>', 'gcc', {})

-- Format

-- Tab selection


-- Telescope
-- vim.api.nvim_set_keymap('n', '<Leader>ff', [[<cmd>lua require('telescope.builtin').find_files()<CR>]], {noremap = true})
-- vim.api.nvim_set_keymap('n', '<C-p>', [[<cmd> lua require('telescope.builtin').git_files()<CR>]], {noremap = true})
bind_key('n', '<C-p>', [[<cmd> lua require('cko.telescope').git_files()<CR>]], {noremap = true})
bind_key('n', '<Leader><C-p>', [[<cmd> lua require('telescope.builtin').git_commits()<CR>]], {noremap = true})
bind_key('n', '<Leader>pp', [[<cmd> lua require('cko.telescope').search_current_folders()<CR>]], {noremap = true})
bind_key('n', '<Leader>fo', [[<cmd> lua require('telescope.builtin').oldfiles()<CR>]], {noremap = true})
bind_key('n', '<Leader>fc', [[<cmd> lua require('cko.telescope').search_relative_files()<CR>]], {noremap = true})
bind_key('n', '<Leader>ff', [[<cmd> lua require('cko.telescope').search_current_folders()<CR>]], {noremap = true})
bind_key('n', '<Leader>fg', [[<cmd> lua require('telescope.builtin').grep_string()<CR>]], {noremap = true})
bind_key('n', '<Leader>fw', [[<cmd> lua require('telescope.builtin').grep_string({search = vim.fn.expand("<cword>")})<CR>]], {noremap = true})
bind_key('n', '<Leader>fl', [[<cmd> lua require('cko.telescope').live_grep()<CR>]], {noremap = true})
bind_key('n', '<Leader>fb', [[<cmd> lua require('telescope.builtin').buffers()<CR>]], {noremap = true})
bind_key('n', '<Leader>fm', [[<cmd> lua require('telescope').extensions.media_files()<CR>]], {noremap = true})
bind_key('n', '<Leader>ww', [[<cmd> lua require('telescope').extensions.git_worktree.git_worktrees()<CR>]], {noremap = true})
bind_key('n', '<Leader>wc', [[<cmd> lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>]], {noremap = true})
bind_key('n', '<Leader>fs', [[<cmd> lua require('telescope.builtin').git_status()<CR>]], {noremap = true})

if not vim.g.use_lsp
then
  bind_key('n', '<Leader>gb', [[<cmd> lua require('cko.telescope').git_branches()<CR>]], {noremap = true})
  bind_key('n', '<Leader>cr', [[<cmd> Telescope coc references<CR>]], {noremap = true})
  bind_key('n', '<Leader>cdf', [[<cmd> Telescope coc definitions<CR>]], {noremap = true})
  bind_key('n', '<Leader>cde', [[<cmd> Telescope coc declarations<CR>]], {noremap = true})
  bind_key('n', '<Leader>ci', [[<cmd> lua require('telescope').extensions.coc.implementations()<CR>]], {noremap = true})
  bind_key('n', '<Leader>cf', [[<cmd> lua require('telescope').extensions.coc.file_code_actions()<CR>]], {noremap = true})
  bind_key('n', '<Leader>cl', [[<cmd> lua require('telescope').extensions.coc.line_code_actions()<CR>]], {noremap = true})
  bind_key('n', '<Leader>csw', [[<cmd> Telescope coc workspace_symbols<CR>]], {noremap = true})
  bind_key('n', '<Leader>csd', [[<cmd> <CR>]], {noremap = true})
end


-- VimSpector
bind_key('n', '<Leader>dd', [[<cmd> lua vim.fn['vimspector#Launch']() <CR>]], {noremap = true})
bind_key('n', '<Leader>dc', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.code)<CR>]], {noremap = true})
bind_key('n', '<Leader>dt', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.tagpage)<CR>]], {noremap = true})
bind_key('n', '<Leader>dv', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.variables)<CR>]], {noremap = true})
bind_key('n', '<Leader>dw', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.watches)<CR>]], {noremap = true})
bind_key('n', '<Leader>ds', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.stack_trace)<CR>]], {noremap = true})
bind_key('n', '<Leader>do', [[<cmd>call v:lua.go_to_window(g:vimspector_session_windows.output)<CR>]], {noremap = true})
bind_key('n', '<Leader>dr', [[<cmd>call vimspector#Reset()<CR>]], {noremap = true})

function _G.go_to_window(id)
   vim.fn.win_gotoid(id)
   vim.fn['MaximizerToggle']()
end

bind_key('n', '<Leader>dtcb', [[<cmd> call vimspector#CleanLineBreakpoint()<CR>]], {noremap = true})
bind_key('n', '<Leader>dl', [[<Plug>VimspectorStepInto]], {})
bind_key('n', '<Leader>dj', [[<Plug>VimspectorStepOver]], {})
bind_key('n', '<Leader>dk', [[<Plug>VimspectorStepOut]], {})
bind_key('n', '<Leader>d_', [[<Plug>VimspectorRestart]], {})
bind_key('n', '<Leader>dcc', [[<Plug>VimspectorRunToCursor]], {})
bind_key('n', '<Leader>db', [[<Plug>VimspectorToggleBreakpoint]], {})
bind_key('n', '<Leader>dcb', [[<Plug>VimspectorToggleConditionalBreakpoint]], {})
bind_key('n', '<Leader>d<space>',[[<cmd>call vimspector#Continue()<CR>]], {noremap = true})

-- Toggle Maximizer
bind_key('n', '<Leader>m', [[<cmd> MaximizerToggle!<CR>]], {noremap = true})

-- Database
-- Dadbod
bind_key('n', '<Leader>bu', '<cmd> DBUIToggle<CR>', { noremap=true, silent=true})

vim.cmd([[
  fun! TrimWhitespace()
     let l:save = winsaveview()
     keeppatterns %s/\s\+$//e
     call winrestview(l:save)
  endfun

  augroup trim_white_space
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
  augroup END
]], false)

return M
-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {noremap = true})
-- vim.api.nvim_set_keymap('n', '<Leader>', [[]], {})
