" GENERAL BINDINGS
" ================
" avoid auto indent on pasting from clipboard
set pastetoggle=<F6>

" interchange : and ;
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

" Make j and k move by wrapped line unless a count was entered
" like `10j`, in which case it behaves normally.
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
vnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
vnoremap <expr> k (v:count == 0 ? 'gk' : 'k')

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

" search with * for visual selection
vnoremap * y/\V<C-R>=escape(@",'/\')<CR><CR>

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

" last inserted text
nnoremap g. :normal! `[v`]<cr><left>

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
nnoremap <silent> ]q :cnext<cr>
nnoremap <silent> [q :cprev<cr>

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
nnoremap <silent> [l :lprev<cr>
nnoremap <silent> ]l :lnext<cr>

" Next/Prev buffers
nnoremap [b :bprev<cr>
nnoremap ]b :bnext<cr>

" LEADER KEY MAPPINGS
" ===================
" Leader Mapping Conventions
" Suppose we have 2 leader mappings:
"
"   nnoremap <leader>x    DoSomething
"   nnoremap <leader>xy   DoSomethingElse
"
" When we press `<leader>x`, vim waits for some interval of time
" before executing `DoSomething`. This is because vim knows
" that there is a possibility that user may press `y` after pressing
" `<leader>x` in which scenario `DoSomethingElse` has to be executed.
"
" Thus defining multiple mappings with same prefix may lead to some
" 'lag' which is not desired.
" To avoid this 'lag', I try to follow some heuristics while defining
" mappings:
"
" 1. Try to keep most mappings of form <leader><key> for 2 keystrokes.
" 2. If a mapping of type <leader><key1> is defined; ensure that NO OTHER
"    MAPPING of form <leader><key1><key2*> has been defined.
" 3. Avoid mapping of type <leader><leader><keys>
" 4. If multiple leader mappings have to be defined for tasks which are
"    grouped(like multiple mappings for a plugin) and they are not that
"    frequently used; it is better to use <leader><plug-key><custom-key> mappings
"    where `plug-key` indicates the plugin type. Although this takes
"    3 keystrokes, it gives a 'modularity' to the mappings
"    Example: See vim-signify/nerdcommenter mappings
" 5. Reserve `<leader><key>` where key is a home row key to most frequently used
"    commands.
"
" Use :map, :(n/v)map to view all existing mappings

let mapleader = "\<Space>"

" Close without saving
nnoremap <leader>q :q!<cr>
nnoremap <leader>Q :qa!<cr>

" Clear highlighting of searched text
nnoremap <silent> <leader>h :nohlsearch<cr>

" Generic substitution command;
" press <c-r><c-w> for current word substitute
" simply type /new_word for substituting last search
nnoremap <leader>r :%s//g<Left><Left>

" insert breakpoint in python
augroup debug_points
    autocmd!
    autocmd FileType python nnoremap <leader>d mzoimport pdb; pdb.set_trace()  # noqa: E702; yapf: disable<Esc>`z
    autocmd FileType python nnoremap <leader>D mzOimport pdb; pdb.set_trace()  # noqa: E702; yapf: disable<Esc>`z

augroup END
