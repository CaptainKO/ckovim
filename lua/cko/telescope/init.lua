local actions = require('telescope.actions')
local sorters = require('telescope.sorters')
local previewers = require('telescope.previewers')
local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup {
  defaults = {
    prompt_position = 'top',
    sorting_strategy = "ascending",
    file_ignore_patterns = {"node_modules", "dist"},
    file_sorter = sorters.get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,
    set_env = { ['COLORTERM'] = 'truecolor' },

    file_previewer   = previewers.vim_buffer_cat.new,
    grep_previewer   = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    mappings = {
      i = {
          ["<C-x>"] = false,
          ["<C-q>"] = actions.send_to_qflist,
        },
      }
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = false, -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",
      },
      media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg"},
      find_cmd = "fdfind" -- find command (defaults to `fd`)
    },
  }
}

telescope.load_extension('fzf')
telescope.load_extension('git_worktree')
telescope.load_extension('coc')
telescope.load_extension('media_files')


local M = {}
local lastFileType
M.live_grep = function ()
  -- require('nvim-web-devicons').setup()
  local opts = {
      vimgrep_arguments = {'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'}
  }

  vim.fn.inputrestore()
  lastFileType = vim.fn.input({prompt = 'File pattern (default:*)', default = lastFileType or ''})
  vim.fn.inputsave()

  if  lastFileType ~= '' then
      opts.vimgrep_arguments[#opts.vimgrep_arguments+1] = '-g'
      opts.vimgrep_arguments[#opts.vimgrep_arguments+1] = lastFileType
  end
  builtin.live_grep(opts);
end

M.git_files = function ()
    -- require('nvim-web-devicons').setup()
    builtin.git_files{ args = { '--no-hidden' } }
end

M.search_relative_files = function()
    -- require('nvim-web-devicons').setup()
    builtin.find_files({
      prompt_title = "Current Folder",
      cwd = vim.fn.expand('%:p:h'),
      find_command = {'rg', '--files' ,'--iglob','!**/.git/**/*' ,'--ignore','--hidden'}
    })
end
M.search_current_folders = function()
    -- require('nvim-web-devicons').setup()
    builtin.find_files({
      prompt_title = "Current Folder",
      cwd = "./" ,
      find_command = {'rg', '--files' ,'--iglob','!**/.git/**/*' ,'--ignore','--hidden'}
    })
end

M.git_branches = function ()
  -- require('nvim-web-devicons').setup()
  builtin.git_branches({ attach_mapping = function (_, map)
    map('i', '<c-d>', actions.git_delete_branch)
    map('n', '<c-d>', actions.git_delete_branch)
    map('i', '<c-e>', actions.git_checkout)
    map('n', '<c-e>', actions.git_checkout)
  end })
end

return M
