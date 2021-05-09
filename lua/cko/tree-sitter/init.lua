require'nvim-treesitter.configs'.setup {
  ensure_installed = {'typescript'},
  -- ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "rust" },
  highlight = {
    -- enable = true,              -- false will disable the whole extension
    enable = false,              -- false will disable the whole extension
  },
   -- incremental_selection = {
   --   enable = false,
   --   keymaps = {
   --         init_selection = "gnn",
   --         node_incremental = "grn",
   --         scope_incremental = "grc",
   --         node_decremental = "grm",
   --       },
   -- },
   -- indent = {
   --   enable = false,
   -- }
}
