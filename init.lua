vim.g.use_lsp = false

if vim.g.vscode then
  require'settings'
else
  require'plugins'
  require'globals'
  require'colorschemes'
  require'plug-config'
  require'settings'
  require'keymappings'
end
