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
nnoremap <silent> <leader>t :Tags<cr>

" ===============================================================
" CLEVER-F
" ===============================================================
let g:clever_f_across_no_line = 1
let g:clever_f_fix_key_direction = 1
let g:clever_f_timeout_ms = 4000

" ===============================================================
" EASY-ALIGN
" ===============================================================
vmap <cr> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" ===============================================================
" GREPPER
" ===============================================================
let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.switch = 1
let g:grepper.dir = 'repo,cwd'
command! Todo Grepper -noprompt -tool git -query -E '(TODO|FIXME|NOTE)'
nnoremap <leader>g :GrepperAg <space>

" ===============================================================
" ALE
" ===============================================================
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_set_highlights = 0

let g:ale_linters = {
\   'python': ['flake8']
\ }

let g:ale_fixers = {
\   'python': ['yapf']
\ }

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '•'

nmap <silent> ]a <Plug>(ale_next_wrap)
nmap <silent> [a <Plug>(ale_previous_wrap)

" ===============================================================
" SIGNIFY
" ===============================================================
let g:signify_disable_by_default = 1
let g:signify_sign_add           = '|'
let g:signify_sign_delete        = '|'
let g:signify_sign_change        = '|'
let g:signify_sign_show_count    = 0

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
        NERDTreeVCS
        NERDTreeClose
        NERDTreeFind
    else
        NERDTree
    endif
endfunction
nnoremap <silent> <leader>nn :call NERDTreeToggleFind()<cr><C-w>=
nnoremap <silent> <leader>nf :NERDTreeFocus<cr>

let NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowLineNumbers = 0

" ===============================================================
" UNDOTREE
" ===============================================================
nnoremap <leader>u :UndotreeToggle<cr><C-w>=
let g:undotree_WindowLayout=3
let g:undotree_SplitWidth=60
let g:undotree_SetFocusWhenToggle=1
let g:undotree_ShortIndicators=1
let g:undotree_HighlightChangedText=0

" ===============================================================
" SYNTAX
" ===============================================================
" Python
let g:python_highlight_all = 1

" CPP
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1
