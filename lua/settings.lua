-- vim.o.lazyredraw = true
-- vim.o.synmaxcol = 90
vim.g.elite_mode = true
vim.g.loaded_matchparen = true
vim.o.backup = false
vim.o.clipboard = 'unnamedplus,unnamed'
vim.o.colorcolumn = "80"
vim.o.encoding = 'UTF-8'
vim.o.errorbells = false
vim.o.expandtab = true
vim.o.exrc = true
vim.o.secure = true
vim.o.hidden = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.mouse = 'a'
vim.o.scrolloff = 10
vim.o.shiftwidth = 2
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.softtabstop = 2
vim.o.swapfile = false
vim.o.syntax = 'on'
vim.o.tabstop = 2
vim.o.wrap = false
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = vim.fn['nvim_treesitter#foldexpr']()
vim.wo.number = true;
vim.wo.relativenumber = true;
vim.wo.wrap = false

-- set foldmethod=expr
-- set foldexpr=nvim_treesitter#foldexpr()
-- vim.g.ftToIgnore = { 'nerdtree', 'fzf' }
vim.api.nvim_exec([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
  augroup END
]], false)
-- autocmd BufEnter,FocusGained,InsertLeave * if index(ftToIgnore, &ft) <1 | set relativenumber
-- autocmd BufLeave,FocusLost,InsertEnter   * if index(ftToIgnore, &ft) <0 | set norelativenumber
