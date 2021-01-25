ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}!"
ZSH_THEME_GIT_PROMPT_CLEAN=""

function prompt_char {
  if [ $UID -eq 0 ];
    then echo "%{$fg[red]%}>%{$reset_color%}";
    else echo "%{$fg[magenta]%}=>%{$reset_color%}";
  fi
}

PROMPT='
%{$fg[red]%}[%{$reset_color%}%{$fg[yellow]%}%n%{$reset_color%}%{$fg[green]%}@%{$reset_color%}%{$fg[blue]%}%m%{$reset_color%}%{$fg[red]%}] %{$fg[cyan]%}%~%{$reset_color%}
$(prompt_char) '

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'
