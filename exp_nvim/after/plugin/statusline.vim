if !exists('g:loaded_lightline')
    finish
endif

let s:special_filetypes = {
    \ 'undotree': 'Undotree',
    \ 'diff': 'Diff',
    \ 'nerdtree': 'NERDTree',
    \ 'tagbar': 'TagBar',
    \ 'quickfix': 'Quickfix List',
    \ 'loclist': 'Location List'
    \ }

let g:lightline = {}
let g:lightline.colorscheme = 'one'
let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ }

let g:lightline.active = {
    \ 'left': [ [ 'active_mode', 'paste' ],
    \           [ 'custom_filename', 'readonly', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ], [ 'filetype' ] ]
    \ }

let g:lightline.inactive = {
    \ 'left': [ [ 'inactive_mode', 'custom_filename', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ] ]
    \ }

let g:lightline.component_function = {
    \   'active_mode': 'LightlineActiveMode',
    \   'inactive_mode': 'LightlineInactiveMode',
    \   'custom_filename': 'LightlineCustomFilename',
    \   'lineinfo': 'LightlineLineInfo',
    \   'filetype': 'LightLineFiletype'
    \ }

function! s:GetFiletype()
    let l:ft = &filetype
    if (l:ft == 'qf')
        let l:ft = getwininfo(win_getid())[0].loclist ? 'loclist' : 'quickfix'
    endif
    return l:ft
endfunction

function! LightlineActiveMode()
    let l:header = get(s:special_filetypes, s:GetFiletype(), '')
    return l:header !=# '' ? l:header : lightline#mode()
endfunction

function! LightlineInactiveMode()
    return get(s:special_filetypes, s:GetFiletype(), '')
endfunction

function! LightlineCustomFilename()
    let l:header = get(s:special_filetypes, s:GetFiletype(), '')
    let l:fname = expand('%:t')
    return l:header !=# '' ? '' :
           \ l:fname !=# '' ? l:fname : '[No Name]'
endfunction

function! LightlineLineInfo()
    return has_key(s:special_filetypes, s:GetFiletype()) ? '' : 
           \ printf("%2dC,%d/%dL", col('.'), line('.'), line('$'))
endfunction

function! LightLineFiletype()
    return has_key(s:special_filetypes, s:GetFiletype()) ? '' : &filetype
endfunction
