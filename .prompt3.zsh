local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

host_color="yellow"
if [ -n "$SSH_CLIENT" ]; then
  host_color="red"
fi

PROMPT='
%{$fg[red]%}[%{$reset_color%}%{$fg[${host_color}]%}%n%{$reset_color%}%{$fg[green]%}@%{$reset_color%}%{$fg[blue]%}%m%{$reset_color%}%{$fg[red]%}]%{$reset_color%} %{$fg[cyan]%}%10c%{$reset_color%}
%{$fg[magenta]%}➜ %{$reset_color%}'

#if [ $return_status 0 ]; then
#  PS1+="%{fg[green]%}➜ %{$reset_color%}";
#else
#  PS1+="%{fg[red]%}➜ %{$reset_color%}";
#fi

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'
