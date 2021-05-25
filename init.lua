vim.g.use_lsp = false

require'settings'

if not vim.g.vscode then
  require'plugins'
  require'globals'
  require'colorschemes'
  require'plug-config'
  require'keymappings'
end
