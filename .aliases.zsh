######################################
#    _   _    ___   _   ___ ___ ___  #
#   /_\ | |  |_ _| /_\ / __| __/ __| #
#  / _ \| |__ | | / _ \\__ \ _|\__ \ #
# /_/ \_\____|___/_/ \_\___/___|___/ #
#                                    #
######################################

#alias vim='nvim'
#alias newusb='sudo wipefs --all /dev/sdc'
alias OSX='./Github/OSX-KVM/OpenCore-Boot.sh'
alias recon='openbox --reconfigure'
alias menu='obmenu-generator -s -c'
alias sudo pacman -S='sudo pacman -S --overwrite "*"'
alias updatemirrors='sudo reflector --verbose --country "United States" -l 20 --sort rate --save /etc/pacman.d/mirrorlist'
#alias updatemirrors='sudo reflector --age 6 --latest 21 --fastest 21 --threads 21 --sort rate --protocol https --save /etc/pacman.d/mirrorlist'
alias sxiv='devour sxiv'
alias mpv='devour mpv'
alias ristretto='devour ristretto'
alias zathura='devour zathura'
alias vlc='devour vlc'
alias figlet='figlet -s -f small'
alias define='dict -d gcide'
#alias cat='bat'
alias history='history 0'
alias whoareyou='print not $USER'
alias color='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias mute='amixer -D pulse set Master 1+ mute'
alias unmute='amixer -D pulse set Master 1+ unmute'
#alias tmux='tmux -2'
alias sshserver='ssh josh@192.168.1.12'
alias sshpi='ssh pi@192.168.1.5'
#alias ip='ifconfig'
alias wifi='nmtui'
alias zshconfig='sudo nano ~/.zshrc'
alias i3config='sudo nano ~/.config/i3/config'
alias polybarconfig='sudo nano ~/.config/polybar/config'
alias update='sudo pacman -Syu -y && yay -Syu -y'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cdl='cd .. && exa -lahFgb --icons --color=automatic'
alias dc='docker-compose'
alias sn='sudo nano'
alias sr='sudo reboot'
alias ss='sudo shutdown -h now'
alias sp='sudo pacman'
alias find='fd'
alias diff='diff-so-fancy'
alias weather='./ansiweather'
alias own='sudo chown -R josh:josh '
alias exe='sudo chmod +x '
alias x='exit'
alias bk='cd "$OLDPWD"'
alias icon='sudo gtk-update-icon-cache /usr/share/icons/*'
alias merge='xrdb -merge ~/.Xresources'
alias icon='sudo gtk-update-icon-cache /usr/share/icons/*'
alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias ytmp3='youtube-dl -x --audio-format mp3'
alias ncmpcpp2='~/.config/ncmpcpp/ncmpcpp-ueberzug/ncmpcpp-ueberzug'

# List Files with color labels
#alias l='els --els-icons=fontawesome'
#alias l='els -1h --els-icons=fontawesome'
#alias ll='els -grAX --els-icons=fontawesome'
#alias ll='els -lASXhbG --els-icons=fontawesome'
#alias ls='els --els-icons=fontawesome'

#alias lc='colorls -lA --sd'
#alias l='colorls --sd'

#alias l='exa -hbG --icons --color=automatic'
alias l='exa --icons'
#alias ll='exa -lhatG --group-directories-first --sort=name --git --time-style=default --time=accessed --icons --color=automatic'
alias ll='exa -lahG --icons --group-directories-first'
alias llr='exa -lahrG@ --icons --sort=type'
alias ls='exa --icons --color=automatic'
alias l.='exa -a | egrep "^\."'
alias llm='exa -albhg --icons --sort=type --color=automatic'
alias la='exa -albhG --icons --color=automatic --sort=type'
alias ld='exa -albhgr --icons --group-directories-first --color=automatic | tac'

# Specialty Views
alias lS='exa -1 --icons --color=automatic'
alias lt='exa --tree --level=2'

# File Management
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'
alias font='fc-cache -f -v'
#alias x="chmod +x"
#alias vi="vim "
#alias sv="sudo vim "
alias pgrep="ps aux | grep"
alias grep="grep --color=auto"
alias mkdir="mkdir -pv"
alias cp='cp -iv -r'
alias mv="mv -iv"
alias rm="rm -Iv"
alias enable_vbox='sudo modprobe vboxdrv vboxnetadp vboxnetflt vboxpci'
alias disable_vbox='sudo modprobe -r vboxdrv vboxnetadp vboxnetflt vboxpci'
alias speed_test='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
alias mpd_start='systemctl start mpd.service mpdscribble.service --user'
alias mpd_stop='systemctl stop mpd.service mpdscribble.service --user'

# Terminal Programs
alias ym="youtube-dl xic --audio-format mp3 --add-metadata "
alias yt="youtube-dl xic --add-metadata "
alias pingg="hostname -I && curl ipinfo.io/ip && ping -c 5 -q google.com"
alias xclip="xclip -selection clipboard"

# Git
alias gcl="git clone --depth 1"
alias gi="git init"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push origin master"
