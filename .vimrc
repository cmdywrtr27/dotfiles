set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'ycm-core/YouCompleteMe'
Plug 'ap/vim-css-color'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'itchyny/vim-gitbranch'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'vifm/vifm.vim'
Plug 'vimwiki/vimwiki'
Plug 'frazrepo/vim-rainbow'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'
Plug 'vim-syntastic/syntastic'
Plug 'jremmen/vim-ripgrep'
Plug 'mbbill/undotree'
Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
Plug 'NovaDev94/lightline-onedark'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimshell.vim'
Plug 'junegunn/vim-emoji'
Plug 'ryanoasis/vim-devicons'

call plug#end()

set formatoptions-=cro

set history=1000

" Enable filetype plugins
filetype plugin indent on

set path+=,,**

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" With a map leader it's possible to do extra key combinations
let mapleader = " "
set modifiable

" Get out of INSERT MODE!
:imap jj <Esc>

" Quick save
noremap <C-w> :w!<CR>

" Quick reload
noremap <C-r> :source ~/.vimrc<CR>

" Gotta run!
noremap <C-q> :confirm qall<CR>

" Nerd Tree
map <C-n> :NERDTreeToggle<CR>
"nnoremap <leader>u :UndotreeToggle<CR>
map <leader>u :UndotreeToggle<CR>
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize = 25
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'r'

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 10 lines to the cursor - when moving vertically using j/k
set scrolloff=10
set sidescrolloff=5

" Vertical windows split to right and horizontal windows split below
set splitright
set splitbelow

set mouse=:a

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu
set wildmode=longest,list,full
set wildchar=<TAB>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Always show current position
set ruler

" Height of the command bar
set showcmd
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
"set hlsearch

" Turn off highlights after search is complete
augroup vimrc-incsearch-highlight
      autocmd!
      autocmd CmdlineEnter /,\? :set hlsearch
      autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Enable syntax highlighting
syntax on
syntax enable

"set guifont=JetBrainsMono\ Nerd\ Font\ 14

" Only set if terminal has 256 colors (ie. xterm-256color)
set t_Co=256
let g:rehash256 = 1

"colorscheme onedark
"colorscheme wombat
colorscheme SlateDark
set background=dark

let g:rainbow_active = 1 "Alternating color of brackets etc.
highlight Pmenu ctermfg=15 ctermbg=8 guifg=#000000 guibg=#DAD7DA
highlight Comment ctermfg=3 ctermbg=none cterm=italic

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8
set fileencoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Don't show 'insert' twice
set noshowmode

" Disable highlight when <leader>h is pressed
noremap <leader>h :noh<CR>

set nohlsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => The "Save your ASS" section
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile
set undodir=~/.vim/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab = 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set linebreak
set tw=500

set autoindent "Auto indent
set smartindent "Smart indent
set nowrap "Wrap lines, or not

""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Close the current buffer
map <leader>bd :Bclose<CR>:tabclose<CR>gT

" Close all the buffers
map <leader>ba :bufdo bd<CR>

" Useful mappings for managing tabs
map <leader>tn :tabnew<CR>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<CR>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<CR>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2
set showtabline=2
set guioptions-=e

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

"set statusline=\ %{HasPaste()}%<%F%m%r%=%b\ %w\ \ %P \ %l/%L:%c

"set statusline=%<%F\ %h%m%r%=%-14.(%l/%L:%c%V%)\ %P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<CR>`z
nmap <M-k> mz:m-2<CR>`z
vmap <M-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<CR>`>my`<mzgv`yo`z

" Delete trailing white space on save, useful for some filetypes ;)
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
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<CR>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><CR>//ge<CR>'tzt'm

" Quickly open a buffer for scribble
map <leader>q :e ~/buffer<CR>

" Quickly open a markdown buffer for scribble
map <leader>x :e ~/buffer.md<CR>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<CR>

"  Use clipboard
let g:clipbrdDefaultReg = '+'
set clipboard=unnamedplus

" Show line numbers
set number
set relativenumber

" So you don't do anything stupid
set confirm

set matchpairs+=<:>

" Set global for search/replace
set gdefault

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

" Don't close window, when deleting a buffer
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'absolutepath' ], [ 'readonly', 'modified', 'ctrlpmark' ] ] ,
      \   'right': [ [ 'syntastic', 'percent', 'lineinfo' ], [ 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'gitbranch': 'branch#name',
      \   'readonly': 'LightLineReadonly',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'LightLineMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"[+]":&modifiable?"":"[-]"}',
      \   'absolutepath': '%F',
      \   'lineinfo': ' %l/%L:%c',
      \   'percent': 'Ξ %P',
      \   'paste': '%{&paste?"PASTE":""}',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \   'tabs': 'tabsel',
      \   'buffers': 'tabsel',
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ [ 'close' ] ],
      \ },
      \ 'separator': { 'left': '▓░', 'right': '░▓'  },
      \ 'subseparator': { 'left': '▓░', 'right': '░▓'  },
      \ }

"      \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2"  },
"      \ 'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3"  },
"      \ }
"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },
"      \ }

"let g:lightline.tab = {
"       \ 'active': [ 'tabnum', 'filename' ],
"       \ 'inactive': [ 'tabnum', 'filename' ],
"       \ }

"let g:lightline.tabline = {
"        \   'left': [ [ 'buffers' ] ],
"        \   'right': [ [ 'string1' ], [ 'string2' ] ],
"        \ }

"let g:lightline#bufferline#composed_number_map = {
"    \ 1: '➊', 2: '➋', 3: '➌', 4: '➍', 5: '➎',
"    \ 6: '➏', 7: '➐', 8: '➑', 9: '➒', 10: '➓ ',
"    \ }

"let g:lightline#bufferline#number_map = {
"    \ 0: '₀', 1: '₁', 2: '₂', 3: '₃', 4: '₄',
"    \ 5: '₅', 6: '₆', 7: '₇', 8: '₈', 9: '₉',
"    \ }

let g:syntastic_phpcs_disable = 1
let g:syntastic_phpmd_disable = 1
let g:syntastic_php_checkers = ['php']
let g:syntastic_quiet_messages = { "type": "style" }
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jump = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

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

augroup AutoSyntastic
    autocmd!
    autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END

function! s:syntastic()
    SyntasticCheck
    call lightline#update()
endfunction

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  try
	if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*FugitiveHead')
	  let mark = ' '  " edit here for cool mark
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

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc . ' ' . WebDevIconsGetFileEncodingSymbol()) : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction"
