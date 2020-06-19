function! pluginhelpers#NERDTreeToggle()
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


function! s:fzf_split_handler(lines) abort
    if empty(a:lines)
        return
    endif

    let l:available_actions = {
        \ 'ctrl-x': 'split',
        \ 'ctrl-v': 'vsplit'
        \ }
    let l:action = remove(a:lines, 0)
    let l:cmd = get(l:available_actions, l:action, 'e')
    for line in a:lines
        execute l:cmd escape(line, ' %#\')
    endfor
endfunction


function! pluginhelpers#FuzzyFileSearch()
    " TODO: display cwd as prompt

    let l:display_options = [
        \ '--reverse',
        \ '--info=inline',
        \ '--margin=1,0',
        \ ]

    let l:action_options = [
        \ '--expect=ctrl-x,ctrl-v'
        \ ]

    let l:all_options = l:display_options + l:action_options
    call fzf#run(fzf#wrap({
        \ 'options': l:all_options,
        \ 'sink*': function('<SID>fzf_split_handler')
        \ }))
endfunction


function! pluginhelpers#UndoTreeToggle()
    echo "NotImplemented"
endfunction
