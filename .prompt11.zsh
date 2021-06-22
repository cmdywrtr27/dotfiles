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

local return_code="%(?..%{$fg[red]%} %? %{$reset_color%})"

zsh_prompt_home_indicator() {
    if [[ "$PWD" = "$HOME" ]];then
      echo " "
    else
      echo "ﱮ "
fi
}

PROMPT='
%{%K{white}%0F%}   %{%K{blue}%F{blue}%}$separator1%{%0F%} $(zsh_prompt_home_indicator) $dir_actual %{%k%F{blue}%}$separator1%{%k$reset_color%} '

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%} %{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[cyan]%}) %{$fg[yellow]%}✖"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
