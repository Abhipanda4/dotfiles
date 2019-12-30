hi ExtraWhiteSpace ctermbg=114
augroup _whitespace
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
augroup END

hi QuickFixLine ctermfg=170 ctermbg=None
hi Search ctermfg=232 ctermbg=170
hi IncSearch ctermfg=170 ctermbg=None
