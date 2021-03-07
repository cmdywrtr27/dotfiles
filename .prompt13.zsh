function calculate_width {
    temp=" ${USER} _ ${HOST} _  _"
    dir_actual=$PWD

    if [[ "$dir_actual[0,${#HOME}]" == "$HOME" ]]
    then
        dir_actual="~$dir_actual[$((${#HOME}+1)),-1]"
    fi

    let remaining=${COLUMNS}-${#temp}
    dir_length=${#dir_actual}
    if [[ "$dir_length" -gt "$remaining" ]]
    then
        dir_actual="...${dir_actual:$(($dir_length-$remaining+3))}"
    fi
}

reload () {
    exec "${SHELL}" "$@"
}

case $TERM in
    termite|*xterm*|rxvt|rxvt-unicode|rxvt-256color|rxvt-unicode-256color|(dt|k|E)term)
        separator1=
        separator2=
        separator3=
        precmd () {
            print -Pn "\e]0;%n@%M: %1~ \a"
            calculate_width
        }
        preexec () {
            print -Pn "\e]0;%n@%M %1~ ($1)\a"
        }
        ;;
    screen|screen-256color)
        separator1=
        separator2=
        separator3=
        precmd () {
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]0;TMUX - %n@%M %1~\a"
            calculate_width
        }
        preexec () {
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]0;TMUX - %n@%M %# %1~ ($1)\a"
        }
        ;;
    *)
        separator1=▒
        separator2=│
        separator3=▒
        precmd () {
            calculate_width
        }
        ;;
esac

zsh_prompt_home_indicator() {
    if [[ "$PWD" = "$HOME" ]];then
      echo " "
    else
      echo " "
fi
}

#PROMPT='%{%B%K{blue}%15F%}  %{%b%K{green}%F{blue}%}$separator1%{%B%15F%} %n@%m %{%b%K{cyan}%F{green}%}$separator1%{%B%15F%} $dir_actual%{%b%k%F{cyan}%}$separator1
#$prompt_is_ssh$separator1 $ranger_level$separator1 $tmux_number$separator1 %{%K{cyan}%B%F{white}%}%(0?,,%{%b%K{cyan}%15F%}$separator2 %{%B%F{white}%}%?)%{%b%k%F{cyan}%}$separator1%{%b%k$reset_color%} '

PROMPT='
%{%K{blue}%15F%}   %{%K{green}%F{blue}%}$separator1%{%0F%} $(zsh_prompt_home_indicator) $dir_actual %{%k%F{green}%}$separator1%{%k$reset_color%}
%{%F{magenta}%}%{%F$reset_color%} '

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'

#$prompt_is_ssh$separator1 $ranger_level$separator1 $tmux_number$separator1 %{%K{cyan}%B%F{white}%}%(0?,,%{%b%K{cyan}%15F%}$separator2 %{%B%F{white}%}%?)%{%b%k%F{cyan}%}$separator1%{%b%k$reset_color%} '

#RPROMPT='%{%F{cyan}%}$separator3%{%B%K{cyan}%F{white}%} %@ %{%b%F{cyan}%}$separator1%{$reset_color%}'

#RPROMPT='%{%F{cyan}%} $(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} %{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}✖"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
