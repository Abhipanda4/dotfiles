hi matchparen ctermbg=39 ctermfg=235

hi BufTabLineCurrent ctermbg=114 ctermfg=236
hi BufTabLineActive ctermbg=237 ctermfg=253
hi BufTabLineHidden ctermbg=235 ctermfg=246

hi CleverFDefaultLabel ctermfg=39

hi ExtraWhiteSpace ctermbg=41
augroup _whitespace
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
augroup END
