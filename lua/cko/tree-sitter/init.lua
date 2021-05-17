
local langs = {
    'html',
    'json',
    'css',
    'yaml',
    'jsdoc',
    'lua',
    'dockerfile',
    'typescript',
}

require'nvim-treesitter.configs'.setup {
  ensure_installed =  langs,
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "rust" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { 'typescript', 'javascript' }
    -- enable = false,              -- false will disable the whole extension
  },

  incremental_selection = {
  enable = true,
    keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        -- scope_incremental = "grc",
        node_decremental = "grm",
    },
  },
  indent = {
    enable = true,
  },
  -- rainbow = {
  --   colors = {
  --     'white',
  --     'red',
  --     'orange',
  --     'yellow',
  --     'blue',
  --     'green',

  --   }
  -- }
}
vim.cmd([[
   set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
]])
