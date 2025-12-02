PROMPT=$'
%{$fg_bold[blue]%}┎───[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg_bold[blue]%}+%{$fg_bold[white]%}%m%{$reset_color%}%{$fg_bold[blue]%}]%{%(?,,%{$fg_bold[blue]%}─[%{$fg_bold[red]%}%?%{$reset_color%}%{$fg_bold[blue]%}])
%{$fg_bold[blue]%}┖─[%{$fg_bold[white]%}%3~$reset_color%}%{$fg_bold[blue]%}]>%{$reset_color%} '
PS2=$' %{$fg_bold[blue]%}|>%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}─[%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg_bold[blue]%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[blue]%} %{$reset_color%}"
