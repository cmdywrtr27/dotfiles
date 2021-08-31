zsh_prompt_home_indicator() {
    if [[ "$PWD" = "$HOME" ]];then
      echo " "
    else
      echo "ﱮ "
fi
}

local return_code="%(?..%{$fg[red]%} %? %{$reset_color%})"

if [[ "$USER" == "root" ]]; then

  PROMPT='
%{$fg[cyan]%}$(zsh_prompt_home_indicator) %~%{$reset_color%}  $(git_prompt_info)'

  PROMPT+="
%(?:%{$fg_bold[red]%}❯%{$fg_bold[yellow]%}❯%{$fg_bold[red]%}❯ :%{$fg_bold[red]%}❯❯❯ )%{$reset_color%}"

  RPROMPT='${return_code} %{$reset_color%}'

#  RPROMPT='$(git_prompt_info)'

else

#  PROMPT='
#%{$fg[cyan]%}  %~%{$reset_color%}  $(git_prompt_info)'

#  PROMPT+="
#%(?:%{$fg_bold[red]%}❯%{$fg_bold[green]%}❯%{$fg_bold[yellow]%}❯ :%{$fg_bold[red]%}❯❯❯ )%{$reset_color%}"

#  RPROMPT='$(git_prompt_info)' 

  PROMPT='
%{$fg[cyan]%}$(zsh_prompt_home_indicator) %~%{$reset_color%}  $(git_prompt_info)'

  PROMPT+="
%(?:%{$fg_bold[magenta]%} :%{$fg_bold[red]%} )%{$reset_color%}"

  RPROMPT='${return_code} %{$reset_color%}'

fi

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%} (%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✖"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
