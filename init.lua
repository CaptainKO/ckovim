if vim.g.vscode  then
        require'settings'
else
        require'plugins'
        require'colorschemes'
        require'plug-config'
        require'settings'
        require'keymappings'
end
