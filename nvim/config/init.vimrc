" Auto install vim-plug before starting
let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
      \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
  augroup _vimplug
      autocmd!
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif
unlet autoload_plug_path

call plug#begin('$HOME/.config/nvim/plugged')

" Autocomplete
Plug 'Shougo/deoplete.nvim'
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'Shougo/deoplete-clangx', { 'for': 'cpp' }

" Colorschemes
Plug 'joshdick/onedark.vim'

" Prerequisite:
" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf; ~/.fzf/install
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

" Utils for editing
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'mhinz/vim-grepper'

" Statusline & Tabline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'ap/vim-buftabline'

" Lint
Plug 'w0rp/ale'

" File Explorer
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeFind', 'NERDTreeFocus'] }

" Language specific plugins
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

" Tags
" Prerequisite: install universal-ctags
Plug 'ludovicchabant/vim-gutentags'

call plug#end()
