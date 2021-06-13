vim.g.startify_change_to_vcs_root = true
vim.g.startify_session_persistence = true
vim.g.startify_lists = {
  { type = 'dir',       header = { '  DIR  '..vim.fn.getcwd() } },
  { type = 'files',     header = { '  MRU' } },
  { type = 'sessions',  header = { '  Sessions' } },
  { type = 'bookmarks', header = { '  Bookmarks' } },
  { type = 'commands',  header = { '  Commands' } },
}
