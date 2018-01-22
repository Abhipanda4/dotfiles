"vim configuration file by Abhisek Panda on Ubuntu 16.04 Vim version 7.4

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
" 10 - AUTO COMPLETION
" 11 - MISCELLANEOUS


"####################################################################################################

"----------------------------------------------------------------------------------------------------
"0.Necessary Requirements
"----------------------------------------------------------------------------------------------------

set nocompatible
filetype off
"autocmd VimEnter * echo '\t\t\t\'Sometimes you must hurt in order to know;\n \t\t\t\tFall in order to grow;\n\t\t\t\tLose in order to gain;\n \t\tBecause life's greatest lessons are learned through pain.\"\n\n\t\t\t\t\t\t\t\t-Nagato Uzumaki\n\n\n\n\n\n\n\n\n"
"


"----------------------------------------------------------------------------------------------------
"1.Plugins:
"----------------------------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/Vundle.vim/            "set run time path to include vundle
call vundle#begin()

Plugin 'gmarik/Vundle.vim'              "let vundle manage vundle,REQUIRED

Plugin 'flazz/vim-colorschemes'         "All in 1 colorscheme pack

Plugin 'scrooloose/nerdcommenter'       "<leader>ci to toggle comment a line

Plugin 'lokaltog/vim-easymotion'        "<leader>/ to start search

Plugin 'tpope/vim-surround'             "Surround areas with brackets or quotes******

Plugin 'alvan/vim-closetag'                "html utility

Plugin 'Valloric/YouCompleteMe'

Plugin 'ap/vim-buftabline'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'godlygeek/tabular'

call vundle#end()
filetype plugin indent on                "Add all plugins before this line


"----------------------------------------------------------------------------------------------------
"2.Line Structure:
"----------------------------------------------------------------------------------------------------

set number
set rnu                                    "Relative line numbering

"----------------------------------------------------------------------------------------------------
"3.Advanced Searching:
"----------------------------------------------------------------------------------------------------

set incsearch                            "Google type search
set hlsearch                            "Highlight search results
set ignorecase
set smartcase                            "Ignore case unless capital letter is entered
set wrapscan



"---------------------------------------------------------------------------------------------------
"4.UserInterface Settings:
"----------------------------------------------------------------------------------------------------

set wildmenu
set wildmode=list:longest,full
"no redrawing when exeecuting macros
set lazyredraw
set ttyfast
set showmatch
set nobackup
set noswapfile
set hidden        "change buffers without saving
set splitbelow
set splitright
set showcmd


"----------------------------------------------------------------------------------------------------
"5.Key Bindings
"----------------------------------------------------------------------------------------------------

nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;
"for using next in character search"
nnoremap <bs> i<bs><esc>l
nnoremap <cr> o<esc>
nnoremap j gj
nnoremap k gk
"Natural movement in case of wrapped lines;NO skipping
nnoremap H ^
nnoremap L g_
nnoremap \ i<space><Esc>
"Disable the arrow keys for familiarization with vim movements"
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

"My own vim-airline

set laststatus=2
set statusline=
set statusline+=\ <
set statusline+=\ %f                    "Full path to file
set statusline+=\ >\ %#Style#\          "Connector
set statusline+=\ Filetype:%y           "Filetype
set statusline+=\ \ %r                  "readonly flag
set statusline+=\ \ \ %m                "[+] if change has occured
set statusline+=%=                      "Jump to right side
set statusline+=\[\ Buf:%n\ \]\         "buffer number settings(experimenting)
set statusline+=%l                      "Current line number
set statusline+=/                       "Separator
set statusline+=%L\                     "Total lines


"----------------------------------------------------------------------------------------------------
"8.Display
"----------------------------------------------------------------------------------------------------

syntax enable
set t_Co=256
set background=dark
colorscheme wal
"others:harlequin,candyman,peaksea,molokai,badwolf,candyman
"jellybeans,gardener
set scrolloff=12                          "Scroll when 6 lines from top or bottom
set cursorline                            "Horizontal highlighting of cursorline


"----------------------------------------------------------------------------------------------------
"9.Leader Key
"----------------------------------------------------------------------------------------------------

let mapleader="\<Space>"

"choose one convention to follow
"I will be following mostly <leader><leader>key OR <leader>key
"this way; vim wont wait for me expecting further action

"mappings of the form <leader><leader>key
"---------------------------------------------
nnoremap <leader><leader>m :vsplit $MYVIMRC<cr>
"to open my vimrc in a vertical split(side by side) during coding
nnoremap <leader><leader>v :source $MYVIMRC<cr>
"to refresh changes in vimrc ton a file without closing

nnoremap <leader><leader>, <esc>mxggvG=`x
"Indent the entire code(= is for indentation)"

"mappings of the form <leader>key
"---------------------------------------------
nnoremap <leader>h :nohlsearch<cr>
"to unhighlight the search matches

nmap <leader>/ <leader><leader>s
"find a word by its first letter-- using easymotion plugin"
imap <leader>/ <esc><leader><leader>s

vnoremap <leader>t :Tabularize /
"tabularise plugin

nnoremap <leader>q :q!<cr>
"quit without saving"

nnoremap <leader>j :bp<cr>
"to go to the previous buffer(vim down)

nnoremap <leader>k :bn<cr>
"to go to the next buffer(vim up)

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
"10.Auto-Completion
"----------------------------------------------------------------------------------------------------

inoremap {<cr> {}<Esc>i<cr><Esc>O


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

"11.2.Statatusline Color:

"statusline config
hi statusline ctermbg=1 ctermfg=16

function! InsertStatuslineColor(mode)            "func to change stl colors on entering insert mode
    " insert mode
    if a:mode == 'i'
        hi Statusline ctermbg=43 ctermfg=16
    elseif a:mode == 'r'
        hi Statusline ctermbg=167
        "replace(shift + r) mode
    else
        hi Statusline ctermbg=40
    endif
endfunction


au InsertEnter * call InsertStatuslineColor(v:insertmode)    "call the func on entering insert mode
au InsertLeave * hi statusline ctermbg=1 ctermfg=16
"on leaving insert mode


"11.3.Timeouts:

set timeoutlen=1000
set ttimeoutlen=0

"11.4.Custom Color-modes

hi IncSearch ctermbg=40 ctermfg=232
hi Search ctermbg=166 ctermfg=232
hi Wildmenu ctermfg=16 ctermbg=255 cterm=bold
hi Style ctermbg=16 ctermfg=255
hi statuslineNC ctermbg=3 ctermfg=16
hi BufTabLineActive ctermbg=3 ctermfg=232
hi BufTabLineCurrent ctermbg=1 ctermfg=232
hi Matchparen ctermbg=41 ctermfg=232
hi cursorline ctermbg=45 ctermfg=None
hi Todo ctermbg=41 ctermfg=255

"11.5. Trailing White Spaces and Leading Tab characters
hi ExtraWhiteSpace ctermbg=41

match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" 12. Plugin Settings
"12.1. CtrlP
let g:ctrlp_by_filename = 1

"12.2 vim buftabline configurations
let g:buftabline_numbers=2
let g:buftabline_indicators=1
