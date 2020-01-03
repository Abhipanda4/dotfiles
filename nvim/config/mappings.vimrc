" GENERAL BINDINGS
" ================
" avoid auto indent on pasting from clipboard
set pastetoggle=<F6>

" interchange : and ;
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" Natural movement in case of wrapped lines; NO skipping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy jumping to beginning and end of line
nnoremap H ^
nnoremap L g_
vnoremap H ^
vnoremap L g_

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

" search results appear in middle of buffer and blink
nnoremap n nzz
nnoremap N Nzz

" search for visual selection
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Enable resaving a file as root with sudo
cmap w!! w !sudo tee % >/dev/null

" visual shifting dows not exit visual mode
vnoremap < <gv
vnoremap > >gv

" follow tradition of C & D
nnoremap Y y$

" Split line at cursor
" Opposite of J(oin) line
nnoremap S i<cr><esc><right>

" use terminal style mappings in cmd mode
cnoremap <C-a> <home>
cnoremap <C-e> <end>

" Better scrolling
noremap <expr> <C-f> max([winheight(0) - 2, 1])
	\ ."\<C-d>".(line('w$') >= line('$') ? "L" : "M")
noremap <expr> <C-b> max([winheight(0) - 2, 1])
	\ ."\<C-u>".(line('w0') <= 1 ? "H" : "M")
noremap <expr> <C-e> (line("w$") >= line('$') ? "j" : "3\<C-e>")
noremap <expr> <C-y> (line("w0") <= 1         ? "k" : "3\<C-y>")

" Insert blank lines with count
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" QUICKFIX LIST SETTINGS
" ========================
" Toggle quickfix window
function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') ==? 'quickfix'
            cclose
            return
        endif
    endfor
    copen
endf

command! ToggleQuickfix call <SID>QuickfixToggle()
nnoremap gq :ToggleQuickfix<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>

" LOCATION LIST SETTINGS
" ========================
function! s:BufferCount()
    return len(filter(range(1, bufnr('$')), 'bufwinnr(v:val) != -1'))
endfunction

function! s:LocListToggle()
    let buffer_count_before = s:BufferCount()
    " Location list can't be closed if there's cursor in it, so we need
    " to call lclose twice to move cursor to the main pane
    silent! lclose
    silent! lclose

    if s:BufferCount() == buffer_count_before
        execute "silent! lopen"
    endif
endfunction

command! ToggleLocList call <SID>LocListToggle()
nnoremap gl :ToggleLocList<cr>
nnoremap [l :lprev<cr>
nnoremap ]l :lnext<cr>

" Next/Prev buffers
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>

" LEADER KEY MAPPINGS
" ===================
let mapleader = "\<Space>"

" Close without saving
nnoremap <leader>q :q!<cr>
nnoremap <leader>Q :qa!<cr>

" Clear highlighting of searched text
nnoremap <silent> <leader>h :nohlsearch<cr>

" insert breakpoint in python
augroup debug_points
    autocmd!
    autocmd FileType python nnoremap <leader>d mzoimport pdb; pdb.set_trace()  # noqa: E702; yapf: disable<Esc>`z
    autocmd FileType python nnoremap <leader>D mzOimport pdb; pdb.set_trace()  # noqa: E702; yapf: disable<Esc>`z
augroup END
