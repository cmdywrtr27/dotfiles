set nocompatible
filetype off

source $HOME/.vim/plugins.vim
source $HOME/.vim/personal.vim
source $HOME/.vim/autocmd.vim
source $HOME/.vim/remaps.vim
source $HOME/.vim/colors.vim

filetype plugin indent on

let mapleader = " "

set modifiable

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

syntax on
syntax enable

source $HOME/.vim/functions.vim
source $HOME/.vim/lightline.vim
