" define mappings from mode to indicators
let g:currentmode = {
    \ 'n'      : 'N ',
    \ 'i'      : 'I ',
    \ 'c'      : 'C ',
    \ 't'      : 'T ',
    \ 'v'      : 'V ',
    \ 'V'      : 'V ',
    \ "\<C-v>" : 'V ',
    \ 'R'      : 'R ',
    \ 'Rv'     : 'R ',
    \ 's'      : 'S ',
    \ 'S'      : 'S '
    \ }

hi StatusLine ctermbg=235 ctermfg=248

" default highlight should match the normal mode highlight
hi ModeHighlight ctermbg=114 ctermfg=232 cterm=bold

" special color groups for statusline
" active status line colors
hi User1 ctermbg=236 ctermfg=250
hi User2 ctermbg=237 ctermfg=250
hi User3 ctermbg=237 ctermfg=250
hi User4 ctermbg=237 ctermfg=250

" Inactive statusline colors
hi User5 ctermbg=245 ctermfg=232
hi User6 ctermbg=236 ctermfg=250

" for extra indicators from plugins
hi User7 ctermbg=180 ctermfg=232
hi User8 ctermbg=168 ctermfg=232
hi User9 ctermbg=114 ctermfg=232

" decide the bg color of mode indicator
function! ChangeModeHighlight() abort
    let l:curr_mode = get(g:currentmode, mode(), '')
    if (l:curr_mode ==# 'N ')
        exe "hi! ModeHighlight ctermbg=114 ctermfg=232"
    elseif (l:curr_mode ==# 'T ')
        exe "hi! ModeHighlight ctermbg=114 ctermfg=232"
    elseif (l:curr_mode ==# 'I ')
        exe "hi! ModeHighlight ctermbg=39 ctermfg=232"
    elseif (l:curr_mode ==# 'V ')
        exe "hi! ModeHighlight ctermbg=170 ctermfg=232"
    elseif (l:curr_mode ==# 'R ')
        exe "hi! ModeHighlight ctermbg=204 ctermfg=232"
    endif
    return ''
endfunction

" Indicates whether in paste mode
function! GetPasteStatus()
    if &paste
        return '| P '
    else
        return ''
endfunction

function! FileFlags()
    " Info about 2 flags:
    "  - whether file is modified
    "  - whether file is readonly/modifiable
    let flag = " "
    let bufnum = bufnr('%')
    let modified = getbufvar(bufnum, '&mod')
    if (modified)
        let flag = " [+] "
    endif
    let readonly = getbufvar(bufnum, '&readonly')
    if (readonly)
        let flag = " [X] "
    endif

    return flag
endfunction

function! ALEWarnings() abort
    if exists('g:loaded_ale')
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        let l:all_non_errors = l:counts.total - l:all_errors
        return l:counts.total == 0 ? "" : "  ".all_non_errors."• "
    endif
    return ""
endfunction

function! ALEErrors() abort
    if exists('g:loaded_ale')
        let l:counts = ale#statusline#Count(bufnr(''))
        let l:all_errors = l:counts.error + l:counts.style_error
        return l:counts.total == 0 ? "" : "  ".all_errors."✘ "
    endif
    return ""
endfunction

function! GetMode(bufftype) abort
    " proper naming for the mode based on buftype
    let buffindicator = "UNKNOWN"
    if (a:bufftype == "qfix")
        let buffindicator = "QUICKFIX"
    elseif (a:bufftype == "undotree")
        let buffindicator = "UNDOTREE"
    elseif (a:bufftype == "diff")
        let buffindicator = "DIFF"
    elseif (a:bufftype == "nerdtree")
        let buffindicator = "NERDTREE"
    endif

    exe "hi! ModeHighlight ctermbg=114 ctermfg=232"
    let mode=""
    let mode.="%#ModeHighlight#"
    let mode.=" "
    let mode.=buffindicator
    let mode.=" "

    return mode
endfunction

function! GetQFixStatusline() abort
    let status=""
    let status.=GetMode("qfix")
    let status.="%0*%=%1* %l/%L "
    let status.="%0*"
    return status
endfunction

function! GetUndotreeStatusline() abort
    let status=""
    let status.=GetMode("undotree")
    let status.="%0*%=%1* %l/%L "
    let status.="%0*"
    return status
endfunction

function! GetDiffStatusline() abort
    let status=""
    let status.=GetMode("diff")
    let status.="%0*%=%1* %l/%L "
    let status.="%0*"
    return status
endfunction

function! GetNerdtreeStatusline() abort
    let status=""
    let status.=GetMode("nerdtree")
    let status.="%0*"
    return status
endfunction

function! GetActiveStatusline() abort
    let status=""
    let status.="%{ChangeModeHighlight()}"
    let status.="%#ModeHighlight#"
    let status.="\ %{g:currentmode[mode()]}"
    let status.="%{GetPasteStatus()}"
    let status.="%1*\ %t%{FileFlags()}"
    let status.="%0*%="
    let status.="%7*%{ALEWarnings()}%8*%{ALEErrors()}"
    let status.="%2*\ %Y\ "
    let status.="%1*\ %cC\ %l/%L\ "
    let status.="%0*"
    return status
endfunction

function! GetInactiveStatusline() abort
    let status=""
    let status.="%6*\ %t%{FileFlags()}"
    let status.="%0*%="
    let status.="%6* %l/%L\ "
    let status.="%0*"
    return status
endfunction

function! GetStatusline(winnum) abort
  let active = a:winnum == winnr()
  if (active)
      let status = GetActiveStatusline()
  else
      let status = GetInactiveStatusline()
  endif
  return status
endfunction

function! s:RefreshStatus()
    let special_bufferlist = ['qf', 'undotree', 'diff', 'nerdtree']
    for nr in range(1, winnr('$'))
        let bufftype = getwinvar(nr, '&filetype', '')
        if (index(special_bufferlist, bufftype) == -1)
            call setwinvar(nr, '&statusline', '%!GetStatusline(' . nr . ')')
        endif
    endfor
endfunction

augroup Statusline
    autocmd!
    autocmd VimEnter,VimLeave,WinEnter,WinLeave,BufWinEnter,BufWinLeave * call <SID>RefreshStatus()
    autocmd filetype qf setlocal statusline=%!GetQFixStatusline()
    autocmd filetype undotree setlocal statusline=%!GetUndotreeStatusline()
    autocmd filetype diff setlocal statusline=%!GetDiffStatusline()
    autocmd filetype nerdtree setlocal statusline=%!GetNerdtreeStatusline()
augroup END
