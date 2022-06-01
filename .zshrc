export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="myprompt"
plugins=(git zsh-autosuggestions zsh-history-substring-search zsh-completions zsh-syntax-highlighting zsh-256color)
fpath+=$HOME/.oh-my-zsh/custom/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv
export PATH="$HOME/.local/bin:$PATH"
export LANG=en_US.UTF-8
export TERM=xterm-256color-italic
export EDITOR=vim
export MANPAGER='/bin/zsh -c "vim -Rn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
export IN_API_KEY="aaabd8de8d644d3d90f679d504b6f264"
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
autoload -U colors && colors
autoload -Uz compinit && compinit
eval "$(starship init zsh)"
#eval "$(oh-my-posh init zsh --config $HOME/.aliens.omp.json)"
