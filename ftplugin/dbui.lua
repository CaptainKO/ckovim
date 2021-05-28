local bind_key = vim.api.nvim_set_keymap

bind_key('n', 'o', '<Plug>(DBUI_SelectLine)', { noremap=true, silent=true})
bind_key('n', '<CR>', '<Plug>(DBUI_SelectLine)', { noremap=true, silent=true})
bind_key('n', 'S', '<Plug>(DBUI_SelectLineVsplit)', { noremap=true, silent=true})
bind_key('n', 'dd', '<Plug>(DBUI_DeleteLine)', { noremap=true, silent=true})
-- bind_key('n', '<c-]>', '<Plug>(DBUI_JumpToForeignKey)', { noremap=true, silent=true})
bind_key('n', 'A', '<Plug>(DBUI_AddConnection)', { noremap=true, silent=true})
bind_key('n', 'h', '<Plug>(DBUI_ToggleDetails)', { noremap=true, silent=true})
bind_key('n', 'R', '<Plug>(DBUI_Redraw)', { noremap=true, silent=true})
bind_key('n', 'r', '<Plug>(DBUI_Rename)', { noremap=true, silent=true})
bind_key('n', 'J', '<Plug>(DBUI_GotoNextSibling)', { noremap=true, silent=true})
bind_key('n', 'K', '<Plug>(DBUI_GotoPrevSibling)', { noremap=true, silent=true})
bind_key('n', '<c-k>', '<Plug>(DBUI_GotoFirstSibling)', { noremap=true, silent=true})
bind_key('n', '<c-j>', '<Plug>(DBUI_GotoLastSibling)', { noremap=true, silent=true})
bind_key('n', '<c-n>', '<Plug>(DBUI_GotoChildNode)', { noremap=true, silent=true})
bind_key('n', '<c-p>', '<Plug>(DBUI_GotoParentNode)', { noremap=true, silent=true})

-- " o - Open/Toggle selected item
-- " S - Open/Toggle selected item in vertical split
-- " d - Delete selected item
-- " R - Redraw
-- " A - Add connection
-- " H - Toggle database details
-- " r - Rename/Edit buffer/connection/saved query
-- " q - Close drawer
-- " <C-j>/<C-k> - Go to last/first sibling
-- " J/K - Go to prev/next sibling
-- " <C-p>/<C-n> - Go to parent/child node
