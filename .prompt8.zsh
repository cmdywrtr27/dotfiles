typeset +H _current_dir="%{$fg[blue]%}%3~%{$reset_color%}"
typeset +H _return_status="%(?..%{$fg[red]%} %? %{$reset_color%})"
typeset +H _hist_no="%{$fg[grey]%}%h%{$reset_color%}"

zsh_prompt_home_indicator() {
    if [[ "$PWD" = "$HOME" ]];then
      echo " "
    else
      echo "ﱮ "
fi
}

## ━━

PROMPT='
%{$fg[magenta]%}$(_user_host)$(zsh_prompt_home_indicator) ${_current_dir} $(git_prompt_info)
%{%(!.${fg[red]}.${fg[green]})%}%{$reset_color%} '

PROMPT2='%{%(!.${fg[red]}.${fg[white]})%}◀%{$reset_color%} '

RPROMPT='${_return_status} %{$reset_color%}'

function _user_host() {
  local me
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

MODE_INDICATOR="%{$fg_bold[yellow]%}❮%{$reset_color%}%{$fg[yellow]%}❮❮%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} %{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}✖"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
