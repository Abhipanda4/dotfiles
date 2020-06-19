" Settings for all third party plugins are defined here
" ============================================================

" Clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 4000

" Pear-Tree
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

" Vim-sandwich
let g:sandwich_no_default_key_mappings = 1
let g:operator_sandwich_no_default_key_mappings = 1
let g:textobj_sandwich_no_default_key_mappings = 1

silent! nmap <unique> Sa <Plug>(operator-sandwich-add)
silent! xmap <unique> Sa <Plug>(operator-sandwich-add)
silent! omap <unique> Sa <Plug>(operator-sandwich-g@)
silent! nmap <unique><silent> Sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> Sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
silent! nmap <unique><silent> Sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
silent! nmap <unique><silent> Srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)

" FZF
" disable line numbers inside fzf search results
augroup fzf
  autocmd!
  autocmd! FileType fzf
  autocmd  FileType fzf set nonumber nornu
    \| autocmd BufLeave <buffer> set number rnu
augroup END

let g:fzf_colors = {
    \ 'fg':      ['fg', 'LineNr'],
    \ 'bg':      ['bg', 'Normal'],
    \ 'hl':      ['fg', 'String'],
    \ 'fg+':     ['fg', 'CursorLine'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+':     ['fg', 'String'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'gutter':  ['bg', 'Normal'],
    \ 'pointer': ['fg', 'Special'],
    \ 'marker':  ['fg', 'Keyword'],
    \ }

let g:fzf_layout = {
    \ 'window': {
        \ 'width': 0.8,
        \ 'height': 0.8,
        \ 'border': 'sharp'
        \ }
    \ }

command! -nargs=0 FuzzyF call pluginhelpers#FuzzyFileSearch()
nnoremap <silent> <leader>f :FuzzyF<cr>

" NERDTree
let g:NERDTreeStatusline = -1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeShowLineNumbers = 0

command! -nargs=0 NERDTreeToggleCmd call pluginhelpers#NERDTreeToggle()
nnoremap <silent> <leader>n :NERDTreeToggleCmd<cr>

" Undotree
command! -nargs=0 UndoTreeToggleCmd call pluginhelpers#UndoTreeToggle()
nnoremap <silent> <leader>u :UndoTreeToggleCmd<cr>
