local actions = require('telescope.actions')
local sorters =require('telescope.sorters')
local previewers = require('telescope.previewers').vim
require('telescope').setup {
    defaults = {
        prompt_position = 'top',
        sorting_strategy = "ascending",
        file_ignore_patterns = {"node_modules"},
        file_sorter = sorters.get_fzy_sorter,
        prompt_prefix = ' >',
        color_devicons = true,

        file_previewer   = previewers.buffer_cat.new,
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
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        media_files = {
          -- filetypes whitelist
          -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
          filetypes = {"png", "webp", "jpg", "jpeg"},
          find_cmd = "fdfind" -- find command (defaults to `fd`)
        },
    }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')
