filetype plugin indent on
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/ide.vim

let g:clipbrdDefaultReg = '+'
set clipboard=unnamed,unnamedplus

set nu rnu
:set formatoptions-=cro
set autoread
let mapleader = " "
:imap jj <Esc>
set scrolloff=10
set sidescrolloff=5
set mouse=a
set wildmenu
set wildmode=longest,list,full
set wildchar=<TAB>
set noruler
set backspace=eol,start,indent
set ignorecase
set smartcase
set incsearch
set confirm
set gdefault
set lazyredraw
set magic
set noshowmatch
set hidden
syntax on
syntax enable
set nohlsearch

augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdlineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

set nobackup
set nowb
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile

set smarttab
set autoindent
set smartindent
set nowrap

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Indentation
set tabstop=4 softtabstop=0 noexpandtab shiftwidth=4

" Syntax highlighting
autocmd BufNewFile,BufRead *.conf setf conf
autocmd BufNewFile,BufRead config setf dosini
autocmd BufNewFile,BufRead *.rasi setf css

" Hex/rgb/rgba colors highlighting
autocmd BufNewFile,BufRead * :ColorHighlight!

" Highlight
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"	Split pane resize
noremap <silent> <C-Up> :vertical resize +5<CR>
noremap <silent> <C-Down> :vertical resize -5<CR>

" Tabs
nnoremap <A-h> :tabprevious<CR>
nnoremap <A-l> :tabnext<CR>
nnoremap <silent> <A-S-h> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-S-l> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
