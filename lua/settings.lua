vim.o.exrc = true
vim.o.secure = true
vim.o.mouse = 'a'
vim.o.syntax = 'on'
vim.o.clipboard = 'unnamedplus,unnamed'
vim.o.hlsearch = false
vim.o.encoding = 'UTF-8'
vim.o.hidden = true
vim.o.errorbells = false
vim.o.smartindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrap = false
vim.o.swapfile = false
vim.o.backup = false
vim.o.incsearch = true
vim.o.scrolloff = 10
vim.o.colorcolumn = "80"

vim.g.elite_mode = true
vim.g.ftToIgnore = { 'nerdtree', 'fzf' }
vim.g.loaded_matchparen = true
vim.cmd('set number relativenumber')

vim.api.nvim_command('augroup numbertoggle')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd BufEnter,FocusGained,InsertLeave * if index(ftToIgnore, &ft) <1 | set relativenumber')
vim.api.nvim_command('autocmd BufLeave,FocusLost,InsertEnter   * if index(ftToIgnore, &ft) <0 | set norelativenumber')
vim.api.nvim_command('augroup END')
