""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Lightline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
      \   'readonly': 'LRO',
      \   'modified': 'LMod',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LType',
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
      \   'tabs': 'tabsel',
      \   'buffers': 'tabsel',
      \ },
      \ 'tabline': {
      \   'left': [ [ 'buffers' ] ],
      \   'right': [ [ 'close' ] ],
      \ },
      \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
      \ 'subseparator': { 'left': '▒', 'right': '░' },
      \ }

"      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
"      \   'modified': '%{&filetype=="help"?"":&modified?"[+]":&modifiable?"":"[-]"}',

"      \ 'separator': { 'left': '▊▋▌▍▎', 'right': '▎▍▌▋▊' },

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

"      \ 'separator': { 'left': '', 'right': '' },
"      \ 'subseparator': { 'left': '', 'right': '' },

let g:tmuxline_theme = {
    \ 'lightline' }

let g:tmuxline_separators = {
    \ 'left' : '▓▒░',
    \ 'left_alt': '▒',
    \ 'right' : '░▒▓',
    \ 'right_alt' : '░',
    \ 'space' : ' '}

let g:tmuxline_preset = {
    \'a'    : '#(whoami)@#H',
    \'b'    : ['#S'],
    \'win'  : ['#I #W'],
    \'cwin' : ['#I #W #F'],
    \'y'    : ['%A'],
    \'z'    : '%B %d'}

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

function! LMod()
  return &ft =~ 'help\|vimfiler' ? '' : &modified ? '[+] ' : &modifiable ? '' : ''
endfunction

function! LRO()
  " ×   
  return &ft !~? 'help\|vimfiler' && &readonly ? ' ' : ''
endfunction

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '[+]' : &modifiable ? '' : '[-]'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '' : ''
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

function! LType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? ' ' . WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : '') : ''
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
