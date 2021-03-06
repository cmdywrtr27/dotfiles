#    ______ _  _ ___  ___
#   |_  / __| || | _ \/ __|
#  _ / /\__ \ __ |   / (__
# (_)___|___/_||_|_|_\\___|

export TERM=xterm-256color
export TERMINAL=alacritty
export BROWSER=brave
export LANG=en_US.UTF-8
export SUDO_EDITOR=vim
export EDITOR=vim
export MANPAGER='/bin/zsh -c "vim -MRn -c \"set buftype=nofile showtabline=0 ft=man ts=8 nomod nolist norelativenumber nonu noma\" -c \"normal L\" -c \"nmap q :qa<CR>\"</dev/tty <(col -b)"'
export PATH="/home/josh/.cargo/bin:$PATH"
export PATH="/home/josh/.local/bin:$PATH"
source ~/.zsh_aliases
source ~/.git.zsh
source ~/.fzf.zsh

###################################################################

# DO NOT EDIT AFTER THIS LINE
# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'Introduce %d'
zstyle ':completion:*' completer _oldlist _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' condition 0
zstyle ':completion:*' expand prefix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SHit TAB for more results...%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' '+m:{[:lower:]}={[:upper:]} m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'Found %e errors...'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true

zstyle ':vcs_info:*' enable git svn
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '✚'
zstyle ':vcs_info:*' unstagedstr '±'
zstyle ':vcs_info:*' formats ' %u%c'
zstyle ':vcs_info:*' actionformats ' %u%c'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

#zstyle ':vcs_info:*' enable git svn
#zstyle ':vcs_info:*' check-for-changes true
#zstyle ':vcs_info:*' unstagedstr    "${FMT_UNSTAGED}"
#zstyle ':vcs_info:*' stagedstr      "${FMT_STAGED}"
#zstyle ':vcs_info:*' actionformats  "${FMT_VCS_STATUS} ${FMT_ACTION}"
#zstyle ':vcs_info:*' formats        "${FMT_VCS_STATUS}"
#zstyle ':vcs_info:*' nvcsformats    ""
#zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

zstyle :compinstall filename '/home/josh/.zshrc'

autoload -Uz compinit
compinit
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep
bindkey -v

# End of lines configured by compinstall
# DO NOT EDIT BEFORE THIS LINE

###################################################################

# User configuration:
setopt nohashdirs
setopt completealiases
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt PROMPT_SUBST

typeset -A key

autoload -U colors && colors

# Prompt Options

#source ~/.prompt1.zsh
#source ~/.prompt2.zsh
#source ~/.prompt3.zsh
#source ~/.prompt4.zsh
#source ~/.prompt5.zsh
#source ~/.prompt6.zsh
#source ~/.prompt7.zsh
#source ~/.prompt8.zsh
#source ~/.prompt9.zsh
#source ~/.prompt10.zsh
#source ~/.prompt11.zsh
#source ~/.prompt12.zsh
source ~/.prompt13.zsh

autoload -U compinit && compinit -u

jfetch
