if vim.g.vscode  then
        require('settings')
else
        require('settings')
        require('plugins')
        require('colorschemes')
        require('keymappings')
        require('plug-config')
end
