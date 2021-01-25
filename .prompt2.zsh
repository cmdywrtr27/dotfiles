PROMPT='
%F{cyan}%~%f
%B%F{blue}❯%F{green}❯%F{red}❯ %b%f'

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'
