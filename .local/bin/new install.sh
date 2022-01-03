#!/bin/bash

echo -e "\n\n\nArch Linux! Woohoo, we're bad ass! \nThis script will install a shitload of apps that you will commonly use and also clone your dotfiles repo from github so you have it locally on your brand new Arch Linux installation! Assuming you didn't fuck that part up. Continue?\n\n\n\n1) Yes [yes/y]	2) No [no/n]"

read -r -p "Are you really, really, really sure you want to proceed? Because once you do, there is no turning back..." start
case $start in
	[yY][eE][sS]|[yY])
		start="true"
		;;

	[nN][oO]|[nN])
		start="false"
		;;
esac

if [[ $start = "true" ]]; then

echo -e "\nUpdating mirrors\n"
sudo reflector --verbose --country "United States" -l 10 --sort rate --save /etc/pacman.d/mirrorlist
sudo pacman -Syy

echo -e "\nInstalling base packages\n"
sudo pacman -S --noconfirm --needed base-devel linux-headers git rsync zsh vim wget curl bash-completion reflector

echo -e "\n1) xf86-video-intel	2) xf86-video-amdgpu	3) none"
read -r -p "Select your graphics drivers: " video

if [[ $video = "1" ]]; then
	driver="xf86-video-intel"

elif [[ $video = "2" ]]; then
	driver="xf86-video-amdgpu"

elif [[ $video = "3" ]]; then
	driver=""

else
	driver=""
fi

sudo pacman -S --noconfirm --needed $driver

echo -e "\nInstalling more packages\n" && sleep 3
sudo pacman -S --noconfirm --needed linux linux-headers tilix xterm bspwm sxhkd openbox lxappearance-obconf dunst ranger rofi xsettingsd lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings lightdm-webkit2-greeter exa firefox nitrogen pcmanfm geany scrot polkit-gnome network-manager-applet xorg pavucontrol pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils blueberry alsa-utils alsa-plugins alsa-firmware alsa-lib gstreamer gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly volumeicon playerctl noto-fonts noto-fonts-emoji npm nodejs rustup xdg-utils xdg-user-dirs gvfs gvfs-smb samba smb-client intel-ucode avahi nss-mdns libreoffice-fresh awesome-terminal-fonts ttf-font-awesome ttf-nerd-fonts-symbols-mono ttf-nerd-fonts-symbols deadbeef ncmpcpp mpd mpc spotify obs-studio mpv vlc brave-bin google-chrome filezilla nextcloud-client gimp ristretto tilda tmux vim zsh nitrogen thunar thunar-volman xsel xclip xdotool
xfce4-power-manager xbindkeys wireless-tools wmctrl w3m visual-studio-code-bin virtualbox-host-modules-arch virtualbox-guest-iso virtualbox virt-viewer virt-manager unclutter unzip tumbler tldr tint2 tar standardnotes-desktop spice-vdagent spice-gtk spice skippy-xd-git ruby qt6ct kvantum kid3-common jre-openjdk jdk-openjdk inkscape gimp imagemagick gtk2-perl gtk-theme-murrine-collection gtk-engine-murrine gtk-engines grub-customizer grive grsync gsimplecal google-chrome go figlet ffmpeg
grub efibootmgr network-manager-applet networkmanager wireless_tools wpa_supplicant dialog os-prober progress dosfstools dmenu ffmpegthumbnailer ffmpegthumbs zip zerotier-gui-git zerotier-one-git tar ntfs-3g openbox-themes npm python-pip cmake cifs-utisl ninja nfs-utils nextcloud-client networkmanager-openvpn mlocate menumaker meld meson menumaker lua logiops net-tools neofetch htop neovim make lm_sensors libvirt libvirt-glib libvirt-python dupeguru broadcom-wl-dkms cava brightnessctl barrier barrier-headless bleachbit blueberry blueman bluetooth-autoconnect bluez boost avahi arc-gtk-theme arandr xrandr alsa alsa-utils archlinux-keyring xkeyboard-config xbindkeys_config-gtk2 tree ttf-all-the-icons ttf-font-awesom ttf-icomoon-feather ttf-material-design-icons-desktop-git ttf-material-design-icons-webfont ttf-material-icons-git ttf-nerd-fonts-symbols openssh

echo "1) yay	2) paru"
read -r -p "Which AUR helper would you like? " helper

if [[ $helper = "1" ]]; then
	git clone https://aur.archlinux.org/yay.git ~/yay
	cd ~/yay
	makepkg -si
	rm -rf ~/yay
	cd ~/

	aur="yay"

elif [[ $helper = "2" ]]; then
	rustup install nightly
	rustup default nightly
	git clone https://aur.archlinux.org/paru.git ~/paru
	cd ~/paru
	makepkg -si
	rm -rf ~/paru
	cd ~/

	aur="paru"

else
	git clone https://aur.archlinux.org/yay.git ~/yay
	cd ~/yay
	makepkg -si
	rm -rf ~/yay
	cd ~/

	aur="yay"

fi

echo -e "\nInstalling required packages from AUR\n" && sleep 3
$aur -S --noconfirm --needed polybar picom-ibhagwan-git brave-bin etcher-bin noto-fonts-emoji nerd-fonts-noto-sans-regular-complete broadcom-bt-firmware-git autotiling rxvt-unicode-pixbuf-patched themix-gui-git logiops-git

echo -e "\nCopying dotfiles\n" && sleep 3
git clone https://github.com/cmdywrtr27/dotfiles ~/.dotfiles
echo -e "\nNow your github stuff is saved locally in your home directory under ~/.dotfiles\n"

echo -e "\nMiscellaneous setup\n"

sudo systemctl enable lightdm
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth

echo -e "\n\n\nOkay I'm done! It's time for your lazy-ass to do something now!\n\n\n"

fi
