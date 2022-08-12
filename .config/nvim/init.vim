" --- General

syntax on
let mapleader = " "

set number
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set clipboard=unnamedplus
set display+=lastline
set confirm
set matchpairs+=<:>
set gdefault
set title
set titlestring=%F
set laststatus=2
set showtabline=2
set guioptions-=e
set termguicolors
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set ignorecase
set smartcase
set wrap
set splitbelow
set splitright
set hidden
set lazyredraw
set magic
set scrolloff=999
set noshowmode
set updatetime=250
set encoding=UTF-8

" --- Plugins

call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'neoclide/coc.nvim'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'machakann/vim-highlightedyank'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'mbbill/undotree'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

call plug#end()

set background=dark
colorscheme purify
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

" --- Remaps

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <silent><leader>[ :BufferLineCyclePrev<CR>
nnoremap <silent><leader>] :BufferLineCycleNext<CR>
nnoremap <silent><leader>q :bdelete<CR>

let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nnoremap <C-u> :UndotreeToggle<CR>

nmap <F8> :TagbarToggle<CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" --- Autocommands

" Remove vert split
" https://www.reddit.com/r/vim/comments/effwku/transparent_vertical_bar_in_vim/
" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
set fillchars=vert:\  "
augroup RemoveVertSplit
    autocmd!
    autocmd BufEnter,ColorScheme * highlight VertSplit ctermfg=1 ctermbg=None cterm=None
augroup END

augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

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

function! <SID>StripTrailingWhitespaces()
  if !&binary && &filetype != 'diff'
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
  endif
endfun

autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre * :call <SID>StripTrailingWhitespaces()

function! RestorePositionofCursor()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

autocmd BufWritePre,FileWritePre,FileAppendPre,FilterWritePre * :call <SID>StripTrailingWhitespaces()

autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" --- Statusline
" --- Airline

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='apprentice'

" --- Lightline

"       \ 'colorscheme': 'apprentice',
"       \ 'mode_map': { 'c': 'NORMAL' },
"       \ 'active': {
"       \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'absolutepath' ], [ 'readonly', 'modified' ] ],
"       \   'right': [ [ 'lineinfo' ], [ 'filetype' ] ],
"       \ },
"       \ 'component_function': {
"       \   'fugitive': 'LightLineFugitive',
"       \   'gitbranch': 'branch#name',
"       \   'readonly': 'RO',
"       \   'modified': 'Mod',
"       \   'filename': 'LightLineFilename',
"       \   'fileformat': 'LightLineFileformat',
"       \   'filetype': 'MyFiletype',
"       \   'fileencoding': 'LightLineFileencoding',
"       \   'mode': 'LightLineMode',
"       \ },
"       \ 'component': {
"       \   'absolutepath': '%f',
"       \   'lineinfo': '%P  %l/%L:%c',
"       \   'paste': '%{&paste?"PASTE":""}',
"       \   'filename': '%F',
"       \ },
"       \ 'component_expand': {
"       \   'buffers': 'lightline#bufferline#buffers',
"       \ },
"       \ 'component_type': {
"       \   'tabs': 'tabs',
"       \   'buffers': 'tabs',
"       \ },
"       \ 'tabline': {
"       \   'left': [ [ 'buffers' ] ],
"       \   'right': [ [ 'close' ] ],
"       \ },
"       \ 'separator': { 'left': '', 'right': '' },
"       \ 'subseparator': { 'left': '', 'right': '' },
"       \ }
