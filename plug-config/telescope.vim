lua << EOF
local actions = require('telescope.actions')
    require('telescope').setup({
       defaults = {
         prompt_position = 'top',
         sorting_strategy = "ascending",
         file_ignore_patterns = {"node_modules"},
         mappings = {
                 i = {
                    ["c-n"] = false,
                    ["c-p"] = false,
                    ["c-j"] = actions.move_selection_next,
                    ["c-k"] = actions.move_selection_previous,
                 },
             },
        },
        extensions = {
            media_files = {
              -- filetypes whitelist
              -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
              filetypes = {"png", "webp", "jpg", "jpeg"},
              find_cmd = "fdfind" -- find command (defaults to `fd`)
            },
      },
    })

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('media_files')
EOF
