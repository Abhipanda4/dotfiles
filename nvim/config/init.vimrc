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
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'deoplete-plugins/deoplete-clang', {'for': 'cpp'}

" UI
Plug 'joshdick/onedark.vim'

" fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Utils for editing
Plug 'rhysd/clever-f.vim'       " level up f & t usage
Plug 'scrooloose/nerdcommenter' " easy commenting
Plug 'wellle/targets.vim'       " additional(and improved) text objects
Plug 'machakann/vim-sandwich'   " add surroundings to a text object
Plug 'junegunn/vim-easy-align'  " align characters across lines
Plug 'junegunn/vim-peekaboo'    " see register contents before pasting

" Project wide search
Plug 'mhinz/vim-grepper'

" Async Linting and Fixing
Plug 'w0rp/ale', {'for': ['python', 'cpp']}

" Git info in gutter
Plug 'mhinz/vim-signify'

" File Explorer
Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeVCS'] }

" Visualize vim's undo management
Plug 'mbbill/undotree'

" Language specific syntax plugins
Plug 'vim-python/python-syntax', { 'for': 'python' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }

" Automate Tags Generation
" Prerequisite: install universal-ctags
Plug 'ludovicchabant/vim-gutentags'

call plug#end()
