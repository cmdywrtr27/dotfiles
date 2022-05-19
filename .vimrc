set nocompatible
filetype off

" Plugins

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'ycm-core/YouCompleteMe'
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install() }}
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
Plug 'kyoz/purify', { 'rtp': 'vim'  }
Plug 'frazrepo/vim-rainbow'
Plug 'xolox/vim-misc'
Plug 'editorconfig/editorconfig-vim'
Plug 'roxma/vim-paste-easy'
Plug 'ervandew/supertab'
Plug 'tmux-plugins/vim-tmux'
Plug 'edkolev/tmuxline.vim'
Plug 'mbbill/undotree'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase'  }
Plug 'ryanoasis/vim-devicons'

call plug#end()

filetype plugin on 
filetype indent on
set modifiable

" Colors

"colorscheme pitch
"colorscheme electron
"colorscheme edge
colorscheme purify
"colorscheme dream
"colorscheme bubblegum-256-dark
"colorscheme pearl
"colorscheme onehalfdark
"colorscheme nord
"colorscheme Tomorrow-Night-Eighties
"colorscheme snazzy
set background=dark

let g:edge_enable_italic = 1
let g:rainbow_active = 1
let g:rehash256 = 1
let g:Hexokinase_highlighters = [ 'backgroundfull'  ]

syntax on
syntax enable

" Lightline

let g:lightline = {
      \ 'colorscheme': 'apprentice',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'absolutepath' ], [ 'readonly', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'gitbranch': 'branch#name',
      \   'readonly': 'RO',
      \   'modified': 'Mod',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \ },
      \ 'component': {
      \   'absolutepath': '%f',
      \   'lineinfo': '%P  %l/%L:%c',
      \   'paste': '%{&paste?"PASTE":""}',
      \   'filename': '%F',
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'tabs': 'tabs',
      \   'buffers': 'tabs',
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ [ 'close' ] ],
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }

"      \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
"      \ 'subseparator': { 'left': '▒', 'right': '░' },

"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },

"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },

"      \ 'separator': { 'left': '▓░', 'right': '░▓'  },
"      \ 'subseparator': { 'left': '▓░', 'right': '░▓'  },

"      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"  },
"      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"  },

let g:tmuxline_theme = {
    \ 'lightline' }

let g:tmuxline_separators = {
    \ 'left'      : '',
    \ 'left_alt'  : '',
    \ 'right'     : '',
    \ 'right_alt' : '',
    \ 'space'     : ' ' }

let g:tmuxline_preset = {
    \'a'    : '#(whoami)@#H',
    \'b'    : ['#S'],
    \'win'  : ['#I #W'],
    \'cwin' : ['#I #W #F'],
    \'y'    : ['%A'],
    \'z'    : '%B %d' }

let g:Powerline_symbols = 'fancy'
let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0
let g:webdevicons_enable_lightline_statusline = 1
let g:lightline#bufferline#show_number = 0
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#number_separator = ' '
let g:lightline#bufferline#more_buffers = '...'
let g:lightline#bufferline#modified = ' [+]'
let g:lightline#bufferline#read_only = ' '
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#shorten_path = 0

function! Mod()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '[+] ' : &modifiable ? '' : ''
endfunction

function! RO()
  return &ft !~? 'help\|vimfiler' && &readonly ? ' ' : ''
endfunction

function! LightLineFugitive()
  try
	if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
	  let mark = '  '  " 
	  let branch = FugitiveHead()
	  return branch !=# '' ? mark.branch : ''
	endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc . ' ' . WebDevIconsGetFileEncodingSymbol()) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction"

" Remaps

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

map <leader>ww :wq!<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-u> :UndotreeToggle<CR>

" Basic Settings

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

set laststatus=2
set showtabline=2
set guioptions-=e

set viminfo='100,<9999,s100

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
set undofile
set undodir=~/.vim/undodir

set encoding=utf-8
set fileencoding=utf-8

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

"set noruler
"set noshowcmd
"set cmdheight=1

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

" Vim Stuff

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

function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
