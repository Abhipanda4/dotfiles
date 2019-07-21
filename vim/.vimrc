" vim configuration file by Abhisek Panda on Manjaro 17.1.6 Vim version 8.0

"===============================================================================
" LAYOUT OF MY VIMRC:
" 0  - NECESSARY REQUIREMENTS
" 1  - PLUGINS
" 2  - CODEBASE FORMATTING
" 3  - ADVANCED SEARCHING
" 4  - UI SETTINGS
" 5  - KEY BINDINGS
" 6  - INDENTATION
" 7  - STATUSLINE
" 8  - DISPLAY
" 9  - LEADER KEY
" 10 - TEXT EDITING TRICKS
" 11 - MISCELLANEOUS
" 12 - PLUGIN SETTINGS
"===============================================================================

"===============================================================================
" 0.NECESSARY REQUIREMENTS
"===============================================================================

set nocompatible
set encoding=utf-8

"===============================================================================
" 1.PLUGINS
"===============================================================================

" Automatically install vim-plug if NOT installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

" General Plugins
Plug 'valloric/YouCompleteMe'           " Best autocomplete engine
Plug 'ap/vim-buftabline'                " Tabline for buffer management
Plug 'itchyny/lightline.vim'            " Lightweight statusbar for vim
Plug 'rhysd/clever-f.vim'               " Use f, t, F, T more conveniently
Plug 'ctrlpvim/ctrlp.vim'               " Fuzzy File Searcher
Plug 'tpope/vim-commentary'             " Light plugin for commenting
Plug 'mileszs/ack.vim'                  " Search for keywords from within vim
Plug 'scrooloose/nerdtree'              " Directory view in a tree format
Plug 'tpope/vim-surround'               " Easier quotes/parenthesis
Plug 'godlygeek/tabular'                " Easy alignment
Plug 'w0rp/ale'                         " Linting Engine
Plug 'flazz/vim-colorschemes'           " One colorscheme pack to rule them all !
Plug 'itchyny/vim-gitbranch'            " See git branch name on lightline

" Language Specific Plugs - Python3
Plug 'vim-python/python-syntax'         " Advanced syntax highlighting for python

call plug#end()

"===============================================================================
" 2.CODEBASE FORMATTING
"===============================================================================

set formatoptions+=1    "Don't end lines with 1-letter words
set wrapscan
set linebreak
set number
set relativenumber

" avoid unnecessary backups
set nobackup
set noswapfile
set nowb

" change buffers without saving
set hidden

" persistent undo
set undofile
set undodir=~/.vim/undodir

"===============================================================================
" 3.ADVANCED SEARCHING
"===============================================================================

set incsearch  " search incrementally
set hlsearch   " Highlight search results
set ignorecase
set smartcase  " Ignore case unless capital letter is entered

"===============================================================================
" 4.UI SETTINGS
"===============================================================================

set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.oo,*.obj,*.exe,*.dll       " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.class                          " Java Class files
set wildignore+=$VIMRUNTIME/doc/*.txt            " Individual helpfiles
set wildignore+=$VIMRUNTIME/doc/*.tar.gz         " compressed helpfiles
" For the `**` meaning, do a `:h starstar-wildcard`
set wildignore+=**/doc/*.txt

set showcmd
set history=100
set cmdheight=2

" no redrawing when executing macros
set lazyredraw
set ttyfast

set showmatch
" add angular brackets to match with %
set matchpairs+=<:>

" override default split directions
set splitbelow
set splitright

"===============================================================================
" 5.KEY BINDINGS
"===============================================================================

set pastetoggle=<F6>

" interchange : and ;
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" quit without saving
nnoremap Q :q!<cr>

" use enter key for adding blank lines
nnoremap <cr> o<esc>

" Natural movement in case of wrapped lines; NO skipping
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" Easy jumping to (B)eginning and (E)nd of line
nnoremap B ^
nnoremap E g_
vnoremap B ^
vnoremap E g_

" Disable the arrow keys for good :)
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Right> <NOP>
inoremap <Left> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>

" Handle splits the right way
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

function! BlinkMatch(t)
    " Blinks the current highlight with bright red for easy following
    hi BlinkRed ctermbg=1 ctermfg=0
    let [l:bufnum, l:lnum, l:col, l:off] = getpos('.')
    let l:current = '\c\%#'.@/
    let l:highlight = matchadd('BlinkRed', l:current, 1000)
    redraw
    exec 'sleep ' . float2nr(a:t * 1000) . 'm'
    call matchdelete(l:highlight)
endf

" search results appear in middle of buffer and blink
nnoremap n nzz:call BlinkMatch(0.2)<cr>
nnoremap N Nzz:call BlinkMatch(0.2)<cr>

" Enable resaving a file as root with sudo
cmap w!! w !sudo tee % >/dev/null

" change working dir to current file's dir
cmap cd. lcd %:p:h

" visual shifting dows not exit visual mode
vnoremap < <gv
vnoremap > >gv

" follow tradition of C & D
nnoremap Y y$

" use terminal style mappings in cmd mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" Scroll a little faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Mappings for jumping to next/prev in quickfix window
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>

"===============================================================================
" 6.INDENTATION
"===============================================================================

set autoindent
set expandtab
set smarttab

" Default python guided indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4

" custom indentation for specific filetypes
augroup indentation
    autocmd!
    autocmd FileType html,css,javascript,javascript.jsx setlocal tabstop=2 shiftwidth=2 softtabstop=2
augroup END

"===============================================================================
" 7.STATUSLINE
"===============================================================================
set laststatus=2
set showtabline=2
" see buftabline config for statusline

"===============================================================================
" 8.DISPLAY
"===============================================================================

syntax enable
set t_Co=256
set background=dark
colorscheme flattened_dark
set scrolloff=5                           "Scroll when 12 lines from top or bottom
set cursorline                            "Horizontal highlighting of cursorline

"===============================================================================
" 9.LEADER KEY
"===============================================================================

let mapleader = "\<Space>"

" Edit my vimrc in a vert-split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" Source my vimrc in place
nnoremap <leader>sv :source $MYVIMRC<cr>

" Clear highlighting of searched text
nnoremap <leader>h :nohlsearch<cr>

" tabularise plugin
vnoremap <leader>t :<C-u>Tabularize /

" vimbuftabline settings
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

" Toggle quickfix window
function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            return
        endif
    endfor
    copen
endf

command! ToggleQuickfix call <SID>QuickfixToggle()
nnoremap <leader>q :ToggleQuickfix<cr>

"===============================================================================
" 10.TEXT EDITING TRICKS
"===============================================================================

" for c style languages, autocomplete {
inoremap {<cr> {}<Esc>i<cr><Esc>O

" change the current word to upper case
inoremap <c-u> <Esc>mzviwU`za

"===============================================================================
" 11.MISCELLANEOUS
"===============================================================================
" 11.1.Open File In Last Editing Position:
augroup Entrypoint
    autocmd!
    " Enter vim at last edit location before closing
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

" 11.2.Timeouts:
set timeoutlen=1000
set ttimeoutlen=0

" 11.3.Custom Color-modes
hi MatchParen cterm=none ctermbg=190 ctermfg=196
hi search cterm=bold ctermbg=3 ctermfg=0
hi incsearch cterm=bold ctermbg=72 ctermfg=0
hi Todo cterm=bold,underline ctermbg=none ctermfg=1

" 11.4. Trailing White Spaces and Leading Tab characters
hi ExtraWhiteSpace ctermbg=41
augroup whitespace
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
augroup END

"===============================================================================
" 12.PLUGIN SETTINGS
"===============================================================================

" 12.1. CtrlP Configurations
let g:ctrlp_mruf_exclude = '*.tar.gz\|bin|.git|*.srt|*.part'

"ctrlp highlight groups
hi ctrlp_hi_0 ctermbg=4 ctermfg=232
hi ctrlp_hi_1 ctermbg=8 ctermfg=250
hi ctrlp_hi_2 ctermbg=247 ctermfg=237

" custom highlight groups for ctrlP status
" Relevant links for future modifications:
" https://github.com/kien/ctrlp.vim/blob/master/doc/ctrlp.txt#L674
" https://gist.github.com/kien/1610859
let g:ctrlp_status_func = {
	\ 'main': 'CtrlP_Statusline_1',
	\ 'prog': 'CtrlP_Statusline_2',
    \ }

fu! CtrlP_Statusline_1(...)
	let byfname = '%#ctrlp_hi_0# '.a:2.' '
	let regex = a:3 ? '| REG ' : ''
	let item = '%#ctrlp_hi_1# '.a:5.' '
	let dir = ' %=%<%#ctrlp_hi_2# '.getcwd().' %*'
    return byfname.regex.item.dir
endf

fu! CtrlP_Statusline_2(...)
	let len = '%#Function# '.a:1.' %*'
	let dir = ' %=%<%#LineNr# '.getcwd().' %*'
	return len.dir
endf

" use ripgrep instead of grep for better speeds. Needs ripgrep to be
" installed.
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

" 12.2. vim buftabline Configurations
hi BufTabLineFill cterm=none ctermbg=8
hi BufTabLineHidden ctermbg=none ctermfg=245
hi BufTabLineActive ctermbg=23 ctermfg=250
hi BufTabLineCurrent cterm=bold ctermbg=109 ctermfg=234

let g:buftabline_numbers = 2
let g:buftabline_indicators = 1

" 12.3. YouCompleteMe Configurations
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_show_diagnostics_ui = 0

" 12.4. Clever-f Configurations
let g:clever_f_across_no_line = 1
let g:clever_f_timeout_ms = 2000
hi CleverFDefaultLabel ctermbg=none ctermfg=43 cterm=underline

" 12.5. Lightline config for statusline
let g:lightline = {
    \ 'colorscheme' : 'solarized_themer',
    \ 'active' : {
        \ 'left' : [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'relativepath', 'modified'] ],
        \ 'right' : [ [ 'gitbranch' ], [ 'lineinfo' ], [ 'fileencoding', 'filetype' ] ]
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
    \ 'enable' : {'statusline' : 1, 'tabline' : 0}
    \ }


" 12.6. python syntax highlight
let g:python_highlight_all = 1

" 12.7. NerdTree Configurations
function! NERDTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand("%"))
        NERDTreeFind
    else
        NERDTreeClose
    endif
endfunction
nnoremap <leader>t :call NERDTreeToggleFind()<cr>

" Some sensible options
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 0
let NERDTreeMinimalUI = 1
let NERDTreeRespectWildIgnore = 1
let NERDTreeShowLineNumbers = 0

" 12.8. Ack searching
if executable('rg')
    let g:ackprg = "rg --vimgrep"
endif
nnoremap <leader>a :Ack!<space>

" 12.9. ALE Configurations
" Use quickfix list instead of loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

" Lint only on saving
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

" Informative and pleasant signs
let g:ale_sign_error = ""
let g:ale_sign_style_error = ""
let g:ale_sign_warning = ""
hi ALEErrorSign cterm=bold ctermfg=1
hi ALEStyleErrorSign ctermfg=5
hi ALEWarningSign ctermfg=2
