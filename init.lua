if vim.g.vscode  then
        require('settings')
else
        require('plugins')
        require('colorschemes')
        require('settings')
        require('keymappings')
        require('plug-config')
end
