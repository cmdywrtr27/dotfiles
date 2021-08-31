zsh_prompt_home_indicator() {
    if [[ "$PWD" = "$HOME" ]];then
      echo " "
    else
      echo "ﱮ "
fi
}

local return_code="%(?..%{$fg[red]%} %? %{$reset_color%})"

PROMPT='
%F{blue}┌─── $(zsh_prompt_home_indicator)%~%{$reset_color%}
%F{blue}└─%f%{$reset_color%} '
RPROMPT='${return_code} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%} %{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%} "
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%}) %{$fg[green]%} "
