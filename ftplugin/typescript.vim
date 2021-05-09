" TODO: use regex
" syntax off
nnoremap <buffer> <leader>zz :find %<.html<CR>
" nnoremap <buffer> <leader>zm :find %:s?component?module?:s?controller?module?:s?service?module?:s?repository?module?:s?entity?module?<CR>
nnoremap <buffer> <leader>zp :find %:s/\(\.\)\@<=module\(\.\)\@=/component/<CR>
nnoremap <buffer> <leader>zo :find %:s?module?controller?:s?service?controller?:s?entity?controller?:s?repository?controller?<CR>
nnoremap <buffer> <leader>zs :find %:s?module?service?:s?controller?service?:s?entity?service?:s?repository?service?<CR>
nnoremap <buffer> <leader>zc :find %<.scss<CR>
nnoremap <buffer> <silent><leader>zm :find %:s/\(\.\)\@<=\(\(component\)\(\.w+\)\?\)\(\.\)\@=/module/:s/\(\.\)\@<=\(\(controller\)\(\.w+\)\?\)\(\.\)\@=/module/:s/\(\.\)\@<=\(\(service\)\(\.w+\)\?\)\(\.\)\@=/module/:s/\(\.\)\@<=\(\(entity\)\(\.w+\)\?\)\(\.\)\@=/module/:s/\(\.\)\@<=\(\(repository\)\(\.w+\)\?\)\(\.\)\@=/module/<CR><CR>
"
