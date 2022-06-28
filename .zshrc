export ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="myprompt"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search zsh-completions)
fpath+=$HOME/.oh-my-zsh/custom/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv
export PATH="$HOME/.local/bin:$PATH"
export LANG=en_US.UTF-8
export TERM=xterm-256color
export EDITOR=vim
export BROWSER=firefox
export MANPAGER='/bin/zsh -c "vim -Rn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
eval "$(starship init zsh)"
#eval "$(oh-my-posh init zsh --config $HOME/.powerlevel10k_modern.omp.json)"
#export NVM_DIR="$HOME/.config/nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
