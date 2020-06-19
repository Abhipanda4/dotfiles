function! bingpot#NERDTreeToggle()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand("%"))
        NERDTreeVCS
        NERDTreeClose
        NERDTreeFind
    else
        NERDTree
    endif
endfunction
