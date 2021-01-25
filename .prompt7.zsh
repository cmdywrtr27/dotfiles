PROMPT=$'
%{\e[0;34m%}┌─[%{\e[0m%}%{\e[0;31m%}%n%{\e[0;33m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}]%{\e[0m%}%{\e[0;34m%} ♰ %{\e[0m%}%b%{\e[0;34m%}[%{\e[0;35m%}%~%{\e[0;34m%}]
%{\e[0;34m%}└─⊳%{\e[0m%} '

PS2=$' \e[0;34m%}>%{\e[0m%} '

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'
