" VIM PLUG - PLUGIN MANAGER   {{{
    let autoload_plug_path = stdpath('data') . '/site/autoload/plug.vim'
    if !filereadable(autoload_plug_path)
      silent execute '!curl -fLo ' . autoload_plug_path . '  --create-dirs 
          \ "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"'
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
    unlet autoload_plug_path
" }}}

call plug#begin('$XDG_CONFIG_HOME/nvim/.vendor')
    " Auto Completion
    Plug 'neovim/nvim-lsp'

    " General Editing
    Plug 'rhysd/clever-f.vim'
    Plug 'tmsvg/pear-tree'
    Plug 'machakann/vim-sandwich'
    Plug 'wellle/targets.vim'
    Plug 'romainl/vim-cool'
    Plug 'preservim/nerdcommenter'

    " Project Explorer
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTree', 'NERDTreeVCS'] }

    " Interactive undo management
    Plug 'mbbill/undotree', { 'on': ['UndotreeToggle'] }

    " Make vim prettier!!
    Plug 'itchyny/lightline.vim'
    Plug 'sheerun/vim-polyglot'
    Plug 'joshdick/onedark.vim'

call plug#end()

" Use space key as leader
let mapleader = "\<Space>"

" set colorscheme
colorscheme onedark

" vim: fdm=marker
