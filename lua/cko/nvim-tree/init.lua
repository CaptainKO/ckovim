vim.g.nvim_tree_side = 'right'
vim.g.nvim_tree_lsp_diagnostics = true

vim.g.nvim_tree_icons = {
  default= '',
  symlink= '',
  git = {
     unstaged= "✗",
     staged= "✓",
     unmerged= "",
     renamed= "➜",
     untracked= "★",
     deleted= "",
      ignored = "◌"
     },
    folder = {
        default = "",
        open = "",
        empty = "",
     empty_open = "",
     symlink= "",
        symlink_open = "",
    },
    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
}
