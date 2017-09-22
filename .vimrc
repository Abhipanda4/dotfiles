"vim configuration file by Abhisek Panda on Ubuntu 16.04 Vim version 7.4

"###################################################################################################
"											INDEX
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
autocmd VimEnter * echo "\t\t\t\"Sometimes you must hurt in order to know;\n \t\t\t\tFall in order to grow;\n\t\t\t\tLose in order to gain;\n \t\tBecause life's greatest lessons are learned through pain.\"\n\n\t\t\t\t\t\t\t\t-Nagato Uzumaki\n\n\n\n\n\n\n\n\n"


"----------------------------------------------------------------------------------------------------
"1.Plugins:
"----------------------------------------------------------------------------------------------------

set rtp+=~/.vim/bundle/vundle/			"set run time path to include vundle
call vundle#rc()

Plugin 'gmarik/vundle'					"let vundle manage vundle,REQUIRED

Plugin 'flazz/vim-colorschemes'			"All in 1 colorscheme pack

Plugin 'scrooloose/nerdcommenter'		"<leader>ci to toggle comment a line

Plugin 'scrooloose/nerdtree'

Plugin 'godlygeek/tabular'				"To arrange a pattern in coloumn(t in command mode)

Plugin 'lokaltog/vim-easymotion'		"<leader>/ to start search

Plugin 'tpope/vim-surround'				"Surround areas with brackets or quotes******

Plugin 'alvan/vim-closetag'				"html utility

Plugin 'tmhedberg/matchit'				"html utility

Plugin 'Valloric/YouCompleteMe'

Plugin 'ap/vim-buftabline'

Plugin '2072/PHP-Indenting-for-VIm'
filetype plugin indent on				"Add all plugins before this line


"----------------------------------------------------------------------------------------------------
"2.Line Structure:
"----------------------------------------------------------------------------------------------------

set number
set rnu									"Relative line numbering

"----------------------------------------------------------------------------------------------------
"3.Advanced Searching:
"----------------------------------------------------------------------------------------------------

set incsearch							"Google type search
set hlsearch							"Highlight search results
set ignorecase
set smartcase							"Ignore case unless capital letter is entered
set nowrapscan



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
set hidden		"change buffers without saving
set splitbelow
set splitright


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
"Disable the arrow keys for familiarization with vim movements"
nnoremap \ i<space><Esc>
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
set noexpandtab


"----------------------------------------------------------------------------------------------------
"7.Statusline
"----------------------------------------------------------------------------------------------------

"My own vim-airline

set laststatus=2
set statusline=
set statusline+=\ <
set statusline+=\ %f					"Full path to file
set statusline+=\ >\ %#Style#\   					"Connector
set statusline+=\ Filetype:%y				"Filetype
set statusline+=\ \ %r					"readonly flag
set statusline+=\ \ \ %m				"[+] if change has occured
set statusline+=%=						"Jump to right side
set statusline+=\[\ Buf:%n\ \]\ 		"buffer number settings(experimenting)
set statusline+=%l			"Current line number
set statusline+=/						"Separator
set statusline+=%L\ 					"Total lines


"----------------------------------------------------------------------------------------------------
"8.Display
"----------------------------------------------------------------------------------------------------

syntax enable
set t_Co=256
set background=dark
colorscheme gardener
"others:harlequin,candyman,peaksea,molokai,badwolf,candyman
"jellybeans,gardener
set scrolloff=6							"Scroll when 6 lines from top or bottom
set cursorline							"Horizontal highlighting of cursorline


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

nnoremap <leader><leader>n :NERDTreeToggle<cr>
"opens up NERDTree

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

nnoremap <leader>r :RainbowToggle<cr>

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

augroup snippets
	autocmd!
	"<leader><leader>m will always write the main statement in every language

	autocmd filetype java inoremap <leader><leader>m public static void main(String args[])
	autocmd filetype java inoremap <leader><leader>, System.out.println(
	autocmd filetype c inoremap <leader><leader>m int main(int argc,char* argv[])
	autocmd filetype c inoremap <leader><leader>h #include<stdio.h><cr>#include<stdlib.h>
	autocmd filetype cpp inoremap <leader><leader>h #include<stdio.h><cr>#include<stdlib.h>
	autocmd filetype cpp inoremap <leader><leader>m int main(int argc,char* argv[])
augroup END



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

hi statusline ctermbg=124 ctermfg=16

function! InsertStatuslineColor(mode)			"func to change stl colors on entering insert mode
	" insert mode
	if a:mode == 'i'
		hi Statusline ctermbg=156 ctermfg=16
	elseif a:mode == 'r'
		hi Statusline ctermbg=167
		"replace(shift + r) mode
	else
		hi Statusline ctermbg=124
	endif
endfunction


au InsertEnter * call InsertStatuslineColor(v:insertmode)	"call the func on entering insert mode
au InsertLeave * hi statusline ctermbg=124 ctermfg=16
"on leaving insert mode


"11.3.Timeouts:

set timeoutlen=1000
set ttimeoutlen=0

"11.4.Custom Color-modes

hi Search ctermfg=226 ctermbg=160 cterm=underline
hi Visual ctermbg=53
hi Matchparen ctermfg=226 ctermbg=197
hi comment cterm=italic ctermfg=244
hi Wildmenu ctermfg=222 ctermbg=NONE cterm=underline
hi Cursorline cterm=None ctermbg=237
hi CursorlineNr cterm=NONE ctermfg=157
hi LineNr ctermbg=232 ctermfg=123
hi Pmenu ctermbg=232 ctermfg=79
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi statuslineNC ctermbg=215 ctermfg=16
hi statement ctermbg=NONE
hi Style ctermbg=16 ctermfg=255
hi filename ctermbg=16 ctermfg=255
hi incsearch ctermbg=196 ctermfg=16
hi storageclass ctermbg=none ctermfg=197
hi TabLineFill ctermfg=16
hi TablineSel ctermbg=16 ctermfg=15
hi Tabline cterm=NONE ctermbg=16 ctermfg=223

"cterm=texttype;
"ctermbg=background;
"ctermfg=textcolor

