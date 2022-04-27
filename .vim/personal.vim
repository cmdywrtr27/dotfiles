map <leader>pp :setlocal paste!<CR>

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

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

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

set nobackup
set nowb
set noswapfile
set undodir=~/.vim/undodir
set undofile

set encoding=utf8
set fileencoding=utf8

set ffs=unix,dos,mac

set noshowmode

set t_Co=256
set termguicolors

set scrolloff=10
set sidescrolloff=5

set splitright
set splitbelow

set mouse=a

let $LANG='en'
set langmenu=en

set path+=,,**

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

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

command! Bclose call <SID>BufcloseCloseIt()

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 25
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

:set formatoptions-=cro

set history=1000

set autoread
au FocusGained,BufEnter * checktime

let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

try
    set switchbuf=useopen,usetab,newtab
    set stal=2
catch
endtry

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif
