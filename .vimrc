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

Plugin 'lokaltog/vim-easymotion'		"<leader><leader>w to jump forward

Plugin 'kien/ctrlp.vim'					"browse files with style

Plugin 'tpope/vim-surround'				"Surround areas with brackets or quotes******

Plugin 'alvan/vim-closetag'				"html utility

Plugin 'tmhedberg/matchit'				"html utility

Plugin 'Valloric/YouCompleteMe'

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 0				"off by default

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
set statusline+=\ <<
set statusline+=\ %F					"Full path to file
set statusline+=\ >>\  					"Connector
set statusline+=\ Filetype:%y				"Filetype
set statusline+=\ \ %r					"readonly flag
set statusline+=\ \ \ %m				"[+] if change has occured
set statusline+=%=						"Jump to right side
set statusline+=\[\ Buf:%n\ \]\ 		"buffer number settings(experimenting)
set statusline+=%#Style#\ %l			"Current line number
set statusline+=/						"Separator
set statusline+=%L\ 					"Total lines


"----------------------------------------------------------------------------------------------------
"8.Display
"----------------------------------------------------------------------------------------------------

syntax enable
set t_Co=256
set background=dark
colorscheme zenburn
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
	autocmd filetype cpp inoremap <leader><leader>m int main(int argc,char* argv[])
	autocmd filetype javascript inoremap <leader><leader>, (function(event) {});<esc>hhi<cr><esc>O
	autocmd filetype javascript inoremap <leader><leader>m $(document).ready(function(){});<esc>hhi<cr><esc>O
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

hi statusline ctermbg=16 ctermfg=172

function! InsertStatuslineColor(mode)			"func to change stl colors on entering insert mode
	if a:mode == 'i'
		hi Statusline ctermbg=16 ctermfg=222
		"insert mode
	elseif a:mode == 'r'
		hi Statusline ctermfg=30
		"replace(shift + r) mode
	else
		hi Statusline ctermfg=49
	endif
endfunction

let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

au InsertEnter * call InsertStatuslineColor(v:insertmode)	"call the func on entering insert mode
au InsertLeave * hi statusline ctermbg=16 ctermfg=172
"on leaving insert mode


"11.3.Timeouts:

set timeoutlen=1000
set ttimeoutlen=0

"11.5.Custom Color-modes

hi Search ctermfg=226 ctermbg=197 cterm=underline
hi Matchparen ctermfg=226 ctermbg=197
hi comment cterm=italic ctermfg=244
hi Wildmenu ctermfg=222 ctermbg=NONE cterm=underline
hi Cursorline cterm=underline ctermbg=NONE
hi CursorlineNr cterm=NONE ctermfg=157
hi LineNr ctermbg=232 ctermfg=123
hi Pmenu ctermbg=232 ctermfg=30
hi Normal ctermbg=NONE
hi NonText ctermbg=NONE
hi statuslineNC ctermbg=16 ctermfg=49
hi statement ctermbg=NONE
hi Style ctermbg=16 ctermfg=255
hi filename ctermbg=16 ctermfg=255
hi incsearch ctermbg=16 ctermfg=157
hi storageclass ctermbg=none ctermfg=197

"cterm=texttype;
"ctermbg=background;
"ctermfg=textcolor

