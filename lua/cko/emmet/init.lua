-- let g:user_emmet_leader_key=','
vim.g.user_emmet_install_global = false
vim.api.nvim_exec([[
   augroup FileTypeEmmetInstall
      autocmd!
      autocmd FileType html,css EmmetInstall
   augroup END
]], false)

