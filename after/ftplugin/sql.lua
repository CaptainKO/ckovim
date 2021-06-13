local bind_key = vim.api.nvim_set_keymap

bind_key('n', '<Leader>be', '<Plug>(DBUI_ExecuteQuery)', { noremap=true, silent=true })
bind_key('n', '<Leader>bf', '<cmd> DBUIFindBuffer<CR>', { noremap=true, silent=true })
bind_key('n', '<Leader>br', '<cmd> DBUIRenameBuffer<CR>', { noremap=true, silent=true })
bind_key('n', '<Leader>bl', '<cmd> DBUILastQueryInfo<CR>', { noremap=true, silent=true })
