if [[ "$USER" == "root" ]]; then

  PROMPT='
%{$fg[cyan]%}%~%{$reset_color%}  $(git_prompt_info)'

  PROMPT+="
%(?:%{$fg_bold[red]%}❯%{$fg_bold[yellow]%}❯%{$fg_bold[red]%}❯ :%{$fg_bold[red]%}❯❯❯ )%{$reset_color%}"

else

#  PROMPT='
#%{$fg[cyan]%}  %~%{$reset_color%}  $(git_prompt_info)'

#  PROMPT+="
#%(?:%{$fg_bold[red]%}❯%{$fg_bold[green]%}❯%{$fg_bold[yellow]%}❯ :%{$fg_bold[red]%}❯❯❯ )%{$reset_color%}"

#  RPROMPT='$(git_prompt_info)' 

  PROMPT='
%{$fg[cyan]%}%~%{$reset_color%}  $(git_prompt_info)'

  PROMPT+="
%(?:%{$fg[red]%}▶%{$fg[green]%}▶%{$fg[yellow]%}▶ :%{$fg[red]%}▶▶▶ )%{$reset_color%}"

fi

#RPROMPT='%{%F{cyan}%} $(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} %{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}✖"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
