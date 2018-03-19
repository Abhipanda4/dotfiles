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

set rtp+=~/.vim/bundle/Vundle.vim/        " set run time path to include vundle
call vundle#begin()

Plugin 'gmarik/Vundle.vim'                " let vundle manage vundle,REQUIRED

Plugin 'flazz/vim-colorschemes'           " All in 1 colorscheme pack

Plugin 'scrooloose/nerdcommenter'         " <leader>ci to toggle comment a line

Plugin 'octol/vim-cpp-enhanced-highlight' " Advances syntax highlighting for cpp

Plugin 'Valloric/YouCompleteMe'           " the ultimate auto complete

Plugin 'ap/vim-buftabline'                " easy management of open buffers

Plugin 'ctrlpvim/ctrlp.vim'               " to search files easily

Plugin 'godlygeek/tabular'                " for aligning text

Plugin 'itchyny/lightline.vim'

Plugin 'rhysd/clever-f.vim'               " use f, t, F, T more conveniently

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

set incsearch  " search incrementally
set hlsearch   " Highlight search results
set ignorecase
set smartcase  " Ignore case unless capital letter is entered
set wrapscan



"---------------------------------------------------------------------------------------------------
"4.UserInterface Settings:
"----------------------------------------------------------------------------------------------------

set wildmenu
set wildmode=list:longest,full
"no redrawing when executing macros
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
    \}

"11.3.Timeouts:

set timeoutlen=1000
set ttimeoutlen=0

"11.4.Custom Color-modes

hi IncSearch ctermbg=40 ctermfg=232
hi Search ctermbg=166 ctermfg=232
hi Wildmenu ctermfg=16 ctermbg=255 cterm=bold
hi statuslineNC ctermbg=3 ctermfg=16
hi BufTabLineActive ctermbg=3 ctermfg=232
hi BufTabLineCurrent ctermbg=1 ctermfg=232
hi Matchparen ctermbg=196 ctermfg=190
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

"12.3 YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_collect_identifiers_from_comments_and_strings=1
