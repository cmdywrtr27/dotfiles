PROMPT=$'
%{$fg[blue]%}┌─[%{$reset_color%}%n%{$fg[blue]%}@%{$reset_color%}%m%{$fg[blue]%}] [%{$reset_color%}%~%{$fg[blue]%}]
%{$fg[blue]%}└──>%{$reset_color%} '
#PS2=$' %{$fg[blue]%}|⊳ >%{$reset_color%} '

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[red]%}[%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[red]%}] "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[yellow]%}⚡%{$reset_color%}"
