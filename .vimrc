set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'ap/vim-css-color'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/vim-gitbranch'

call vundle#end()

filetype plugin indent on

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

colorscheme cobalt
set background=dark

let mapleader = " "

fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<space>
endfun

function! s:check_back_space() abort
    let col = col('.') -1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

cnoremap w!! w !sudo tee % > /dev/null

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

:imap jj <Esc>
syntax enable
let g:rehash256 = 1
noremap <leader>z :tab split<CR>
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize = 20

set laststatus=2
set t_Co=256
set number relativenumber
set nu
set noshowmode
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set guicursor=
set hidden
set noerrorbells
set smartindent
set scrolloff=10
set mouse=nicr
set splitbelow splitright
set path+=**
set wildmenu
set incsearch
set nobackup
set noswapfile
set fillchars+=vert:\

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()

function! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
