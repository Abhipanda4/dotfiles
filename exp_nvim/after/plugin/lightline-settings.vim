if !exists('g:loaded_lightline')
    finish
endif

let s:plugin_filetypes = {
    \ 'undotree': 'Undotree',
    \ 'diff': 'Diff',
    \ 'nerdtree': 'NERDTree',
    \ 'tagbar': 'TagBar'
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

let g:lightline.component_function = {
    \   'active_mode': 'LightlineActiveMode',
    \   'inactive_mode': 'LightlineInactiveMode',
    \   'active_filename': 'LightlineActiveFilename',
    \   'inactive_filename': 'LightlineInactiveFilename',
    \   'lineinfo': 'LightlineLineInfo',
    \   'filetype': 'LightLineFiletype'
    \ }

let g:lightline.active = {
    \ 'left': [ [ 'active_mode', 'paste' ],
    \           [ 'active_filename', 'readonly', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ], [ 'filetype' ] ]
    \ }

let g:lightline.inactive = {
    \ 'left': [ [ 'inactive_mode', 'inactive_filename' ] ],
    \ 'right': [ [ 'lineinfo' ] ]
    \ }

function! LightlineActiveMode()
    let l:buf_filetype = &filetype
    let l:header = get(s:plugin_filetypes, l:buf_filetype, '')
    let l:fname = expand('%:t')
    return l:header !=# '' ? l:header :
           \ lightline#mode()
endfunction

function! LightlineInactiveMode()
    let l:buf_filetype = &filetype
    let l:header = get(s:plugin_filetypes, l:buf_filetype, '')
    return l:header
endfunction

function! LightlineActiveFilename()
    let l:buf_filetype = &filetype
    let l:header = get(s:plugin_filetypes, l:buf_filetype, '')
    let l:fname = expand('%:t')
    return l:header !=# '' ? '' :
           \ l:fname !=# '' ? l:fname : '[No Name]'
endfunction

function! LightlineInactiveFilename()
    let l:buf_filetype = &filetype
    let l:header = get(s:plugin_filetypes, l:buf_filetype, '')
    let l:fname = expand('%:t')
    return l:header !=# '' ? '' :
           \ l:fname !=# '' ? l:fname : '[No Name]'
endfunction

function! LightlineLineInfo()
    let l:is_plugin = has_key(s:plugin_filetypes, &filetype)
    return has_key(s:plugin_filetypes, &filetype) ? '' : 
           \ printf("%2dC,%d/%dL", col('.'), line('.'), line('$'))
endfunction

function! LightLineFiletype()
    return has_key(s:plugin_filetypes, &filetype) ? '' : &filetype
endfunction
