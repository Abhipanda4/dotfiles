" ===============================================================
" DEOPLETE
" ===============================================================
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

let g:deoplete#enable_at_startup = 1
call deoplete#custom#var('clangx', 'clang_binary', '/usr/bin/clang')

" ===============================================================
" FZF
" ===============================================================
" disable line numbers inside fzf search results
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set nonumber nornu
    \| autocmd BufLeave <buffer> set number rnu
augroup END

" Better colors for fzf
let g:fzf_colors = {
\   'bg+':     ['bg', 'Normal'],
\   'fg+':     ['fg', 'Statement'],
\   'info':    ['fg', 'MatchParen'],
\   'pointer': ['fg', 'Special'],
\   'prompt':  ['fg', 'Special']
\ }

" minimal statusline
function! s:fzf_statusline()
  highlight fzf1 ctermfg=232 ctermbg=114
  highlight fzf2 ctermbg=235
  setlocal statusline=%#fzf1#\ FZF\ %#fzf2#
endfunction
autocmd! User FzfStatusLine call <SID>fzf_statusline()

nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>b :Buffers<cr>

" ===============================================================
" CLEVER-F
" ===============================================================
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 4000

" ===============================================================
" TABULAR
" ===============================================================
vnoremap <leader>t :<C-u>Tabularize /

" ===============================================================
" VIM-SANDWICH
" ===============================================================

" ===============================================================
" PEAR-TREE
" ===============================================================
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" ===============================================================
" GREPPER
" ===============================================================
let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.switch = 0
let g:grepper.dir = 'repo,cwd'
command! Todo Grepper -noprompt -tool git -query -E '(TODO|FIXME|NOTE)'
nnoremap <leader>g :GrepperAg <space>

" ===============================================================
" LIGHTLINE
" ===============================================================
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

" ===============================================================
" ALE
" ===============================================================
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_linters = {
\   'python': ['flake8']
\ }

let g:ale_fixers = {'python': ['yapf']}

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'

nmap <silent> ]a <Plug>(ale_next_wrap)
nmap <silent> [a <Plug>(ale_previous_wrap)

" ===============================================================
" SIGNIFY
" ===============================================================
let g:signify_sign_add        = '|'
let g:signify_sign_delete     = '|'
let g:signify_sign_change     = '|'
let g:signify_sign_show_count = 0

nnoremap <leader>ss :SignifyToggle<cr>
nnoremap <leader>sd :SignifyHunkDiff<cr>
nnoremap <leader>su :SignifyHunkUndo<cr>

" ===============================================================
" NERDTREE
" ===============================================================
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

let NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowLineNumbers = 0

" ===============================================================
" SYNTAX
" ===============================================================
let g:python_highlight_all = 1
