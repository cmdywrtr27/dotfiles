setopt PROMPT_SUBST

autoload -U add-zsh-hook
autoload -Uz vcs_info

# Use True color (24-bit) if available.
if [[ "${terminfo[colors]}" -ge 256 ]]; then
    oxide_turquoise="%F{73}"
    oxide_orange="%F{179}"
    oxide_red="%F{167}"
    oxide_limegreen="%F{107}"
else
    oxide_turquoise="%F{cyan}"
    oxide_orange="%F{yellow}"
    oxide_red="%F{red}"
    oxide_limegreen="%F{green}"
fi

# Reset color.
oxide_reset_color="%f"

# VCS style formats.
FMT_UNSTAGED="%{$oxide_reset_color%} %{$oxide_orange%}●"
FMT_STAGED="%{$oxide_reset_color%} %{$oxide_limegreen%}✚"
FMT_ACTION="(%{$oxide_limegreen%}%b%{$oxide_reset_color%})"
FMT_VCS_STATUS="on %{$oxide_turquoise%} %b%u%c%{$oxide_reset_color%}"

# Executed before each prompt.
add-zsh-hook precmd vcs_info

# Oxide prompt style.
PROMPT=$'\n%{$oxide_turquoise%}  %~%{$oxide_reset_color%}\n%{$oxide_lime_green%}▶ %{$oxide_reset_color%} '

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'
