set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'ycm-core/YouCompleteMe'
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
"Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-prettier', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-tslint', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'jiangmiao/auto-pairs'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'RohanPoojary/pleasant.vim'
Plug 'frazrepo/vim-rainbow'
Plug 'tmux-plugins/vim-tmux'
Plug 'edkolev/tmuxline.vim'
Plug 'mbbill/undotree'
Plug 'gko/vim-coloresque'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ryanoasis/vim-devicons'

call plug#end()

:set formatoptions-=cro

set history=1000

filetype plugin indent on

set path+=,,**

set autoread
au FocusGained,BufEnter * checktime

let mapleader = " "
set modifiable

:imap jj <Esc>

noremap <C-w> :w!<CR>

noremap <C-r> :source ~/.vimrc<CR>

noremap <C-q> :confirm qall<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-u> :UndotreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 25
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=10
set sidescrolloff=5

set splitright
set splitbelow

set mouse=a

let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

set wildmenu
set wildmode=longest,list,full
set wildchar=<TAB>

set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set noruler
set showcmd
set cmdheight=1

set hidden

set backspace=eol,start,indent
set whichwrap+=<,>

set ignorecase
set smartcase

set incsearch
set hlsearch
augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdlineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

set lazyredraw

set magic

set noshowmatch
set mat=2

set noerrorbells
set visualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

syntax on
syntax enable

colorscheme dream
"colorscheme purify
"colorscheme bubblegum-256-dark
"colorscheme pearl
"colorscheme onehalfdark
"colorscheme nord
"colorscheme Tomorrow-Night-Eighties
"colorscheme snazzy
set background=dark

set t_Co=256
set termguicolors

let g:rainbow_active = 1
let g:rehash256 = 1

set encoding=utf8
set fileencoding=utf8

set ffs=unix,dos,mac

set noshowmode

noremap <leader>h :noh<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile
set undodir=~/.vim/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab

set shiftwidth=4
set tabstop=4
set softtabstop=4

set linebreak
set tw=500

set autoindent
set smartindent
set wrap
set nostartofline

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

map <leader>te :tabedit <C-r>=expand("%:p:h")<CR>/

map <leader>cd :cd %:p:h<cr>:pwd<CR>

try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Because tmux is actually spelled T.W.A.T
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2
set showtabline=2
set guioptions-=e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map 0 ^

nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" Delete trailing white space on save
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>pp :setlocal paste!<CR>

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use system clipboard
let g:clipbrdDefaultReg = '+'
set clipboard=unnamedplus

set number
set relativenumber

set display+=lastline

set confirm

set matchpairs+=<:>

set gdefault

set title
set titlestring=%F

set viminfo='100,<9999,s100

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! ClipboardYank()
	call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
	let @@ = system('xclip -o -selection clipboard')
endfunction

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

vnoremap <silent><leader>y y:call ClipboardYank()<CR>
vnoremap <silent><leader>d d:call ClipboardYank()<CR>
nnoremap <silent><leader>p :call ClipboardPaste()<CR>

source $HOME/.vim/lightline.vim
