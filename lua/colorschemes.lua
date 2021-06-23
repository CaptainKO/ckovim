vim.o.termguicolors = true
vim.o.background = 'dark'
--vim.cmd('colorscheme gruvbox')
vim.g.gruvbox_material_palette = 'original'
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_enable_italic = false
vim.g.gruvbox_material_enable_bold = true
vim.api.nvim_exec([[
function! Gruvbox_material_custom() abort
  " Link a highlight group to a predefined highlight group.
  " See `colors/gruvbox-material.vim` for all predefined highlight groups.
  " highlight! link TSString Green
  "highlight! link TSProperty Fg
  "highlight! link TSKeyword OrangeBold
  hi! link VirtualTextError Red
  hi! link VirtualTextWarning Yellow
  hi! link VirtualTextHint AquaBold
  hi! link VirtualTextInfo Aqua
  hi! link TSTag AquaBold
  "hi! link TSPunctDelimiter Fg
  hi! link TSTagDelimiter AquaBold
  "hi! link TSKeywordOperator OrangeBold
  hi! link TSTag Blue
  "hi! link TSTagDelimiter Blue

  hi! link htmlTSProperty Aqua
  hi! link htmlTSKeyword PurpleBold
  "hi! link typescriptDotNotation Fg
  "hi! link typescriptTypeAnnotation Fg
  "hi! link typescriptObjectColon Fg
  "hi! link typescriptDecorator PurpleItalic
  "hi! link typescriptObjectLabel Fg
  hi! link htmlTagName Aqua
  hi! link htmlTagN Blue
  hi! link htmlTag Blue
  hi! link htmlArg Blue
  hi link htmlTSString Green
  " Initialize the color palette.
  " The first parameter is a valid value for `g:gruvbox_material_background`,
  " and the second parameter is a valid value for `g:gruvbox_material_palette`.
  let l:palette = gruvbox_material#get_palette('medium', 'original')
  " Define a highlight group.
  " The first parameter is the name of a highlight group,
  " the second parameter is the foreground color,
  " the third parameter is the background color,
  " the fourth parameter is for UI highlighting which is optional,
  " and the last parameter is for `guisp` which is also optional.
  " See `autoload/gruvbox_material.vim` for the format of `l:palette`.
  " call gruvbox_material#highlight('groupE', l:palette.red, l:palette.none, 'undercurl', l:palette.red)
  " call gruvbox_material#highlight('TSString', l:palette.red, l:palette.none, )
endfunction

augroup GruvboxMaterialCustom
  autocmd!
  autocmd ColorScheme gruvbox-material call Gruvbox_material_custom()
augroup END

" colorscheme gruvbox-material
]],false)
vim.cmd('colorscheme gruvbox-material')
vim.g.airline_theme = 'gruvbox_material'

