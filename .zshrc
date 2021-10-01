export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="arrow.custom"
plugins=(git zsh-autosuggestions z)
source $ZSH/oh-my-zsh.sh
export PATH="/home/josh/.local/bin:$PATH"
export TERM=rxvt-256color
export LANG=en_US.UTF-8
export SUDO_EDITOR=vim
export EDITOR=vim
export MANPAGER='/bin/zsh -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
#(cat ~/.config/wpg/sequences &)
