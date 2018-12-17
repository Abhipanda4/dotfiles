"vim configuration file by Abhisek Panda on Manjaro 17.1.6 Vim version 8.0

"###################################################################################################
"                                            INDEX
"####################################################################################################

" 0  - NECESSARY REQUIREMENTS
" 1  - PLUGINS
" 2  - LINE STRUCTURE
" 3  - ADVANCED SEARCHING
" 4  - USER INTERFACE SETTINGS
" 5  - KEY BINDINGS
" 6  - INDENTATION
" 7  - STATUSLINE
" 8  - DISPLAY
" 9  - LEADER KEY
" 10 - INSERT MODE TRICKS
" 11 - MISCELLANEOUS
" 12 - PLUGIN SETTINGS

"####################################################################################################

"----------------------------------------------------------------------------------------------------
"0.Necessary Requirements
"----------------------------------------------------------------------------------------------------

set nocompatible
filetype off

"----------------------------------------------------------------------------------------------------
"1.Plugins:
"----------------------------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim/        " set run time path to include vundle
call vundle#begin()

Plugin 'ap/vim-buftabline'                " easy management of open buffers

Plugin 'ctrlpvim/ctrlp.vim'               " to search files easily

Plugin 'flazz/vim-colorschemes'           " All in 1 colorscheme pack

Plugin 'gmarik/Vundle.vim'                " manage plugins easily

Plugin 'godlygeek/tabular'                " for aligning text

Plugin 'itchyny/lightline.vim'            " lightweight statusbar for vim

Plugin 'octol/vim-cpp-enhanced-highlight' " Advances syntax highlighting for cpp

Plugin 'rhysd/clever-f.vim'               " use f, t, F, T more conveniently

Plugin 'scrooloose/nerdcommenter'         " <leader>ci to toggle comment a line

Plugin 'mileszs/ack.vim'                  " Search for keywords from within vim

Plugin 'vim-python/python-syntax'         " advanced syntax highlighting for python

Plugin 'majutsushi/tagbar'                " for a quick overview of code and quick nav

Plugin 'skywind3000/asyncrun.vim'         " Asynchronously execute cmds, no need to leave vim anymore

"Plugin 'valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on       "Add all plugins before this line

"----------------------------------------------------------------------------------------------------
"2.Line Structure:
"----------------------------------------------------------------------------------------------------

set number
set rnu         "Relative line numbering

"----------------------------------------------------------------------------------------------------
"3.Advanced Searching:
"----------------------------------------------------------------------------------------------------

set incsearch  " search incrementally
set hlsearch   " Highlight search results
set ignorecase
set smartcase  " Ignore case unless capital letter is entered
set wrapscan
set linebreak

"---------------------------------------------------------------------------------------------------
"4.UserInterface Settings:
"----------------------------------------------------------------------------------------------------

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
set cmdheight=2
set foldcolumn=1

"no redrawing when executing macros
set lazyredraw
set ttyfast

set showmatch
"add angular brackets to match with %
set matchpairs+=<:>

"change buffers without saving
set hidden
"override default split directions
set splitbelow
set splitright

"avoid unnecessary backups
set nobackup
set noswapfile
set nowb

"----------------------------------------------------------------------------------------------------
"5.Key Bindings
"----------------------------------------------------------------------------------------------------

set pastetoggle=<F5>

"interchange : and ;
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

"enable backspace
nnoremap <bs> i<bs><esc>l
"use enter key for adding blank lines
nnoremap <cr> o<esc>

"Natural movement in case of wrapped lines;NO skipping
nnoremap j gj
nnoremap k gk
"sensible line navigation
nnoremap H ^
nnoremap L g_

"Disable the arrow keys for good :)
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Right> <NOP>
inoremap <Left> <NOP>
nnoremap <Up> <NOP>
nnoremap <Down> <NOP>
nnoremap <Right> <NOP>
nnoremap <Left> <NOP>

"Handle splits the right way
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"search results appear in middle of buffer
nnoremap n nzz
nnoremap N Nzz

"Enable resaving a file as root with sudo
cmap w!! w !sudo tee % >/dev/null

"change working dir to current file's dir
cmap cd. lcd %:p:h

"visual shifting dows not exit visual mode
vnoremap < <gv
vnoremap > >gv

"----------------------------------------------------------------------------------------------------
"6.Indentation
"----------------------------------------------------------------------------------------------------"

set autoindent
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

"----------------------------------------------------------------------------------------------------
"7.Statusline
"----------------------------------------------------------------------------------------------------
set laststatus=2
set showtabline=2
"see buftabline config for statusline

"----------------------------------------------------------------------------------------------------
"8.Display
"----------------------------------------------------------------------------------------------------

syntax enable
set t_Co=256
set background=dark
colorscheme wal
"others:harlequin,candyman,peaksea,molokai,badwolf,candyman
"jellybeans,gardener
set scrolloff=12                          "Scroll when 12 lines from top or bottom
set cursorline                            "Horizontal highlighting of cursorline

"----------------------------------------------------------------------------------------------------
"9.Leader Key
"----------------------------------------------------------------------------------------------------

let mapleader="\<Space>"
"I will be following mostly <leader><leader>key OR <leader>key
"this way; vim wont wait for me expecting further action

"mappings of the form <leader><leader>key
"---------------------------------------------
"to open my vimrc in a vertical split(side by side) during coding
nnoremap <leader><leader>m :vsplit $MYVIMRC<cr>
"to refresh changes in vimrc ton a file without closing
nnoremap <leader><leader>v :source $MYVIMRC<cr>

"Indent the entire code(= is for indentation)"
nnoremap <leader><leader>, <esc>mxggvG=`x

"mappings of the form <leader>key
"---------------------------------------------
"to unhighlight the search matches
nnoremap <leader>h :nohlsearch<cr>

"tabularise plugin
vnoremap <leader>t :Tabularize /

"quit without saving"
nnoremap <leader>q :q!<cr>

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

"----------------------------------------------------------------------------------------------------
"10.Insert Mode Tricks
"----------------------------------------------------------------------------------------------------

" for c style languages, autocomplete {
inoremap {<cr> {}<Esc>i<cr><Esc>O

" change the current word to upper case
inoremap <c-u> <Esc>mzviwU`za

"----------------------------------------------------------------------------------------------------
"11.Miscellaneous
"----------------------------------------------------------------------------------------------------
"11.1.Open File In Last Editing Position:
augroup Entrypoint
    autocmd!
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal! g`\"" |
                \ endif
augroup END

"11.2.Timeouts:
set timeoutlen=1000
set ttimeoutlen=0

"11.3.Custom Color-modes
hi IncSearch ctermbg=40 ctermfg=232
hi Search ctermbg=166 ctermfg=232
hi Wildmenu ctermfg=16 ctermbg=255 cterm=bold
hi statuslineNC ctermbg=3 ctermfg=16
hi cursorline ctermbg=232
hi BufTabLineActive ctermbg=3 ctermfg=232
hi BufTabLineCurrent ctermbg=1 ctermfg=232
hi Matchparen ctermbg=196 ctermfg=190
hi Visual ctermbg=3 ctermfg=234
hi Error ctermfg=0 ctermbg=41

"ctrlp highlight groups
hi ctrlp_hi_0 ctermbg=1 ctermfg=0
hi ctrlp_hi_1 ctermbg=8 ctermfg=7
hi ctrlp_hi_2 ctermbg=2 ctermfg=6

"11.4. Trailing White Spaces and Leading Tab characters
hi ExtraWhiteSpace ctermbg=41
augroup whitespace
    autocmd!
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
augroup END

"----------------------------------------------------------------------------------------------------
"12. Plugin Settings
"----------------------------------------------------------------------------------------------------

"12.1. CtrlP
let g:ctrlp_by_filename = 1
let g:ctrlp_mruf_exclude = '*.tar.gz\|bin|.git|*.srt|*.part'
let g:ctrlp_clear_cache_on_exit = 0

"custom highlight groups for ctrlP status
"Relevant links for future modifications:
"https://github.com/kien/ctrlp.vim/blob/master/doc/ctrlp.txt#L674
"https://gist.github.com/kien/1610859
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

"12.2. vim buftabline configurations
let g:buftabline_numbers=2
let g:buftabline_indicators=1

"12.3. YouCompleteMe
let g:ycm_path_to_python_interpreter = '/usr/bin/python'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_autoclose_preview_window_after_completion=0

"12.4. Clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_timeout_ms=2000
hi CleverFDefaultLabel ctermbg=None ctermfg=41 cterm=underline

"12.5. Lightline config for statusline
let g:lightline = {
    \ 'colorscheme' : 'wombat',
    \ 'active' : {
        \ 'left' : [ [ 'mode', 'paste' ],
        \           [ 'readonly', 'relativepath', 'modified'] ],
        \ 'right' : [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
        \},
    \ 'inactive' : {
        \ 'left' : [ ['relativepath'], ['modified'] ]
        \},
    \ 'component' : {
        \ 'lineinfo': "%{line('.') . '/' . line('$')}",
        \},
    \ 'enable' : {'statusline' : 1, 'tabline' : 0}
    \ }

"12.6 python syntax highlight
let g:python_highlight_all = 1

"12.7 Tagbar configurations
nnoremap <leader>t :TagbarToggle<cr>
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
hi TagbarHighlight ctermbg=44 ctermfg=232

"12.8 Async
"open quickfix window automatically when something adds to it
augroup async_quickfix
    autocmd QuickFixCmdPost * botright copen 20
augroup END

"see real time python output
let $PYTHONUNBUFFERED=1
