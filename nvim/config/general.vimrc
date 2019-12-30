" display settings
syntax enable
set t_Co=256
set background=dark
set encoding=UTF-8
set scrolloff=5
colorscheme onedark

" Line settings
set formatoptions+=1    "Don't end lines with 1-letter words
set wrapscan
set linebreak
set backspace=indent,eol,start
set number
set relativenumber

" Enter vim at last edit location before closing
augroup Entrypoint
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal! g`\"" |
        \ endif
augroup END

" StatusLine settings
set showtabline=0
set laststatus=2

" Indentation settings
set autoindent
set expandtab
set smarttab

set tabstop=4
set softtabstop=4
set shiftwidth=4

" search settings
set incsearch  " search incrementally
set hlsearch   " Highlight search results
set ignorecase
set smartcase  " Ignore case unless capital letter is entered
set magic

" avoid unnecessary backups
set nobackup
set noswapfile
set nowritebackup

" change buffers without saving
set hidden

" persistent undo
set undofile
set undodir=$HOME/.config/nvim/.undodir

set wildmenu
set wildmode=list:longest,full

" Standard list; copied from somewhere i don't remember
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.oo,*.obj,*.exe,*.dll       " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=$VIMRUNTIME/doc/*.txt            " Individual helpfiles
set wildignore+=$VIMRUNTIME/doc/*.tar.gz         " compressed helpfiles
set wildignore+=**/doc/*.txt

set showcmd
set cmdheight=2
set history=1000

" no redrawing when executing macros
set lazyredraw

" add angular brackets to match with %
set matchpairs+=<:>
set showmatch

" override default split directions
set splitbelow
set splitright

" Timeout settings
set updatetime=100
set timeoutlen=1000
set ttimeoutlen=0
