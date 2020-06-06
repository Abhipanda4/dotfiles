function! s:GetRootDir()
    let l:cwd = expand('%:p:h')
    let l:git_root_dir = finddir('.git/..', l:cwd.';')
    if l:git_root_dir ==# ''
        return l:cwd
    endif
    return l:git_root_dir
endfunction


function! s:DecideSearchDir(input_dir)
    " TODO: Convert relpath 
    return a:input_dir
endfunction


function! thunder#GrepToQFix(query, ...)
    let l:input_dir = get(a:, 1, '')
    let l:search_dir = s:DecideSearchDir(l:input_dir)
    let l:grep_cmd = 'grep '.a:query.' '.l:search_dir
    exe 'silent! '.l:grep_cmd.' | copen'
endfunction

function! thunder#NERDTreeToggle()
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
