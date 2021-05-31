
local langs = {
    'html',
    'json',
    'jsonc',
    'css',
    'scss',
    'yaml',
    'jsdoc',
    'lua',
    'dockerfile',
    'typescript',
    'go',
    'gomod',
    'comment'
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = langs,
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "rust" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- enable = false,
  },

  incremental_selection = {
  enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    -- enable = true,
    disable = false,
  },
  rainbow = {
    enable = true,
    extended = true,
    max_file_lines = 1000
  }
}

vim.cmd([[
   set foldmethod=expr foldexpr=nvim_treesitter#foldexpr()
]])
