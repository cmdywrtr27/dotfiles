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
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'SiddharthShyniben/pitch'
Plug 'sainnhe/edge'
Plug 'ivanlhz/vim-electron'
Plug 'frazrepo/vim-rainbow'
Plug 'tmux-plugins/vim-tmux'
Plug 'edkolev/tmuxline.vim'
Plug 'mbbill/undotree'
Plug 'gko/vim-coloresque'
"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'ryanoasis/vim-devicons'

call plug#end()
