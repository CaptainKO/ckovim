function! PlugLoaded(name)
    return (
        \ has_key(g:plugs, a:name)
        \ )
endfunction
        "&&
        " \ isdirectory(g:plugs[a:name].dir) &&
        " \ stridx(&rtp, g:plugs[a:name].dir) >= 0
