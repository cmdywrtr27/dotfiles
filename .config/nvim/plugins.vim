call plug#begin('~/.config/nvim/plugged')
	Plug 'dracula/vim', {'as': 'dracula'}
	Plug 'tpope/vim-sensible'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	"Plug 'itchyny/vim-gitbranch'
	Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
	Plug 'chrisbra/Colorizer'
	Plug 'Yggdroot/indentLine'
	Plug 'majutsushi/tagbar'
	"Plug 'itchyny/lightline.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'vim-scripts/DoxygenToolkit.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-surround'
	Plug 'frazrepo/vim-rainbow'
	Plug 'sheerun/vim-polyglot'
	Plug 'mbbill/undotree'
	Plug 'mengelbrecht/lightline-bufferline'
	Plug 'joshdick/onedark.vim'
	Plug 'tpope/vim-fugitive'
	Plug 'NovaDev94/lightline-onedark'
	Plug 'gko/vim-coloresque'
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
	Plug 'ryanoasis/vim-devicons'
call plug#end()

"let g:SnazzyTransparent = 1
let g:dracula_colorterm = 0
colorscheme onedark

map <leader>P :setlocal paste!<CR>

vnoremap <silent><leader>y y:call ClipboardYank()<CR>
vnoremap <silent><leader>d d:call ClipboardYank()<CR>
nnoremap <silent><leader>p :call ClipboardPaste()<CR>

function! ClipboardYank()
	call system('xclip -i -selection clipboard', @@)
endfunction
function! ClipboardPaste()
	let @@ = system('xclip -o -selection clipboard')
endfunction

function! HasPaste()
	if &paste
		return 'PASTE MODE '
	endif
	return ''
endfunction

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

"autocmd vimenter * NERDTree
"autocmd vimenter * wincmd p
map <silent> <C-n> :NERDTreeToggle<CR>
map <silent> <C-F> :NERDTreeFind<CR>
map <leader>u :UndotreeToggle<CR>
let NERDTreeAutoDeleteBuffer = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeWinSize = 25
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeShowLineNumbers = 0
let NERDTreeAutoDeleteBuffer = 1

filetype plugin indent on
let g:instant_markdown_browser = "brave"

let tagbar_width = 30
let tagbar_sort = 0
let tagbar_compact = 1
let tagbar_show_linenumbers = -1
nmap <silent> <C-T> :TagbarToggle<CR>

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let g:colorizer_colornames = 0
let g:colorizer_auto_color = 1
let g:colorizer_use_virtual_text = 0

let g:Hexokinase_highlighters = [ 'backgroundfull' ]

let g:rainbow_active = 1

" Airline
let g:airline_powerline_fonts=1
let g:Powerline_symbols = 'fancy'
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tabs_label = 'neovim'
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_close_button = 0

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
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

function! LightLineModified()
return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
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

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" 	Status bar settings
let g:lightline = {
\	'colorscheme': 'onedark',
\ 	'mode_map': { 'c': 'NORMAL' },
\   'active': {
\		'left':[
\			[ 'mode', 'paste', 'fugitive' ],
\			[ 'cocstatus', 'coccurrentfunction', 'readonly', 'filename', 'modified' ] ], 
\       'right':[
\ 			[ 'lineinfo' ],
\ 			[ 'percent' ],
\ 			[ 'filetype' ] ],
\	},
\	'component': { 
\ 		'lineinfo': ' %l/%L:%-2v%<',
\ 		'percent': '%P',
\   	'paste': '%{&paste?"PASTE":""}',
\ 		'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
\   	'modified': '%{&filetype=="help"?"":&modified?"[+]":&modifiable?"":"[-]"}',
\ 	},
\	'component_function': {
\ 		'mode': 'LightLineMode',
\ 		'filetype': 'MyFiletype',
\ 		'filename': 'LightLineFilename',
\ 		'readonly': 'LightLineReadonly',
\ 		'cocstatus': 'coc#status',
\ 		'coccurrentfunction': 'CocCurrentFunction',
\ 		'gitbranch': 'gitbranch#name',
\ 		'fugitive': 'LightLineFugitive',
\ 	},
\ 	}

let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }

let g:Powerline_symbols = 'fancy'
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

set noshowmode
set laststatus=2
set showtabline=2
set showcmd
set cmdheight=1
