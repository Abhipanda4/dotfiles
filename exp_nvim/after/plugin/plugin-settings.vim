" Clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 4000

" Pear-Tree
let g:pear_tree_repeatable_expand = 0  " DO NOT make auto-pairing dot repeatable
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

" NERDTree
command! -nargs=0 CustomNERDTree call thunder#NERDTreeToggle()
nnoremap <silent> <leader>n :CustomNERDTree<cr>
let g:NERDTreeStatusline = -1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeRespectWildIgnore = 1
let g:NERDTreeShowLineNumbers = 0
