let mapleader = " "

vnoremap <silent><leader>y y:call ClipboardYank()<CR>
vnoremap <silent><leader>d d:call ClipboardYank()<CR>
nnoremap <silent><leader>p :call ClipboardPaste()<CR>

map 0 ^

nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

map <leader>te :tabedit <C-r>=expand("%:p:h")<CR>/

map <leader>cd :cd %:p:h<cr>:pwd<CR>

noremap <leader>h :noh<CR>

:imap jj <Esc>

noremap <C-w> :w!<CR>
noremap <C-r> :source ~/.vimrc<CR>
noremap <C-q> :confirm qall<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-u> :UndotreeToggle<CR>
