setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{blue}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f⊳%f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}⊳%f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{magenta}%M%f' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

local user_host="${PR_USER}%F{yellow}@${PR_HOST}"
local current_dir="%B%F{cyan}%~%f%b"
local git_branch='$(git_prompt_info)'

PROMPT="
┌─[${user_host}] ${current_dir}
└──$PR_PROMPT "

RPROMPT='${return_code} $(git_prompt_info) %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

}
