export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="plain"
plugins=(git zsh-autosuggestions zsh-history-substring-search)
source $ZSH/oh-my-zsh.sh
export PATH="/home/josh/.local/bin:$PATH"
export TERM=rxvt-unicode-256color
export LANG=en_US.UTF-8
export EDITOR=vim
export MANPAGER='/bin/zsh -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
#autoload -U compinit -i
#eval "$(starship init zsh)"
