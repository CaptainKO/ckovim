
vim.cmd([[ let $FZF_DEFAULT_OPTS='--reverse' ]])


vim.g.fzf_layout = { window = { width = 0.95, height = 0.8 } }
vim.g.fzf_preview_window = { 'right:45%', 'ctrl-\\' }
vim.g.fzf_action = {
   ['ctrl-t'] = 'tab split',
   ['ctrl-x'] = 'split',
   ['ctrl-v'] = 'vsplit',
}
