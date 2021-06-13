lua << EOF
vim.g.use_lsp = false
require'settings'
require'keymappings'

if not vim.g.vscode then
  require'plugins'
  require'globals'
  require'colorschemes'
  require'plug-config'
end
EOF
