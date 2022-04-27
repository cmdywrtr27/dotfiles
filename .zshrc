# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="plain"
plugins=(git zsh-autosuggestions zsh-history-substring-search)
source $ZSH/oh-my-zsh.sh
export PATH="/home/josh/.local/bin:$PATH"
export PATH="$PATH:$HOME/.opam/default/bin"
export PATH="/home/josh/.local/bin/node-v14.15.4-linux-x64/bin:$PATH"
export TERM=rxvt-unicode-256color
export LANG=en_US.UTF-8
export EDITOR=vim
export MANPAGER='/bin/zsh -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
#autoload -U compinit -i
#eval "$(starship init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
