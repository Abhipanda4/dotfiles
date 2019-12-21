" FZF settings
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>

" Use grepper for project wide search
nnoremap <leader>a :GrepperAg <space>

" Clever-f settings
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 4000

" tabularise plugin
vnoremap <leader>t :<C-u>Tabularize /

" Deoplete settings
let g:deoplete#enable_at_startup = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

" lightline settings
let g:lightline = {
    \ 'colorscheme' : 'onedark',
    \ 'active' : {
        \ 'left' : [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'relativepath', 'modified'] ],
        \ 'right' : [ [ 'gitbranch', 'linter_warnings', 'linter_errors', 'linter_ok' ],
        \           [ 'lineinfo' ], [ 'fileencoding', 'filetype' ] ]
    \ },
    \ 'inactive' : {
        \ 'left' : [ ['relativepath'], ['modified'] ]
    \ },
    \ 'component' : {
        \ 'lineinfo': "%{line('.') . '/' . line('$')}",
    \ },
    \ 'component_function' : {
        \ 'gitbranch': 'gitbranch#name',
    \ },
    \ 'component_expand': {
        \ 'linter_warnings': 'LightlineLinterWarnings',
        \ 'linter_errors': 'LightlineLinterErrors',
        \ 'linter_ok': 'LightlineLinterOK'
    \ },
    \ 'component_type': {
        \ 'readonly': 'error',
        \ 'linter_warnings': 'warning',
        \ 'linter_errors': 'error',
        \ 'linter_ok': 'ok'
    \ },
    \ 'enable' : {'statusline' : 1, 'tabline' : 0}
    \ }

function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    return l:counts.total == 0 ? '✓' : ''
endfunction

augroup _lightline_ale
    autocmd!
    autocmd User ALEFixPre   call lightline#update()
    autocmd User ALEFixPost  call lightline#update()
    autocmd User ALELintPre  call lightline#update()
    autocmd User ALELintPost call lightline#update()
augroup end

" Buftabline
nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

let g:buftabline_numbers = 2
let g:buftabline_indicators = 1

" ALE configuration
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = {'python': ['yapf']}

nmap <silent> ]a <Plug>(ale_next_wrap)
nmap <silent> [a <Plug>(ale_previous_wrap)

" NERDTree setting
function! NERDTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand("%"))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction
nnoremap <silent> <leader>n :call NERDTreeToggleFind()<cr><C-W>=
nnoremap <silent> <leader>t :NERDTreeFocus<cr>

" Some sensible options
let NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowLineNumbers = 0

" Python syntax
let g:python_highlight_all = 1

"Signify options
let g:signify_sign_add        = '+'
let g:signify_sign_delete     = '~'
let g:signify_sign_change     = '!'
let g:signify_sign_show_count = 0

nnoremap <leader>ss :SignifyToggle<cr>
nnoremap <leader>sd :SignifyHunkDiff<cr>
nnoremap <leader>su :SignifyHunkUndo<cr>
