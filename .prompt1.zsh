PROMPT='
%{$fg[cyan]%}%10c%{$reset_color%}
%{$fg_bold[red]%}%{$fg_bold[green]%}%{$fg_bold[yellow]%}%{$reset_color%} '

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}  git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
