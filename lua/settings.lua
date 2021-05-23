-- vim.o.lazyredraw = true
-- vim.o.synmaxcol = 90
vim.g.elite_mode = true
vim.g.loaded_matchparen = true
vim.o.backup = false
vim.o.clipboard = 'unnamedplus,unnamed'
vim.o.colorcolumn = "80"
vim.o.encoding = 'UTF-8'
vim.o.errorbells = false
vim.o.exrc = true
vim.o.secure = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.mouse = 'a'
vim.o.scrolloff = 15
-- vim.o.shellcmdflag='-ic'
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.smartcase = true
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.w.autoindent = true
vim.w.smartindent = true
vim.w.smartcase = true
vim.w.expandtab = true
vim.w.softtabstop = 2
vim.w.shiftwidth = 2
vim.w.tabstop = 2
vim.o.swapfile = false
vim.o.syntax = 'on'
vim.o.wrap = false
vim.o.showmode = false
vim.wo.cursorline = true
-- vim.wo.foldenable = false
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = vim.fn['nvim_treesitter#foldexpr']()
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.foldlevel = 3
vim.o.foldlevelstart = 2
vim.wo.wrap = false

-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
vim.g.ftToIgnore = { 'nerdtree', 'fzf' , 'NvimTree'}
vim.api.nvim_exec([[
  augroup Numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * if index(ftToIgnore, &ft) < 1 | set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * if index(ftToIgnore, &ft) < 1 |set norelativenumber
  augroup END
  augroup JsonToJsonc
      autocmd! FileType json set filetype=jsonc
  augroup END
]], false)

-- vim.api.nvim_exec([[
--   augroup Completion
--     autocmd!
--     autocmd BufEnter * lua require'completion'.on_attach()
--   augroup END
-- ]], false)
-- vim.api.nvim_exec([[
-- augroup remember_folds
--   autocmd!
--   autocmd BufWinLeave * mkview
--   autocmd BufWinEnter * silent! loadview
-- augroup END
-- ]], false)
-- autocmd BufEnter,FocusGained,InsertLeave * if index(ftToIgnore, &ft) <1 | set relativenumber
-- autocmd BufLeave,FocusLost,InsertEnter   * if index(ftToIgnore, &ft) <0 | set norelativenumber
