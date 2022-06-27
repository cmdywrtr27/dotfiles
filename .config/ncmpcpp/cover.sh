#!/bin/bash

MUSIC_DIR=$HOME/Music

COVER=/tmp/cover.jpg

function reset_background
{
    printf "\e]20;;100x100+0+50\a"
#    printf "\e]20;;75x75+0+5\a"
#    printf "\e]20;;100x100+1000+1000\a"
}

{
    album="$(mpc --format %album% current)"
    file="$(mpc --format %file% current)"
    album_dir="${file%/*}"
    [[ -z "$album_dir" ]] && exit 1
    album_dir="$MUSIC_DIR/$album_dir"

    covers="$(find "$album_dir" -type d -exec find {} -maxdepth 1 -type f -iregex ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" \; )"
    src="$(echo -n "$covers" | head -n1)"
    rm -f "$COVER"
    if [[ -n "$src" ]] ; then
        #resize the image's height to 300px & extent it to cover the urxvt length
        convert "$src" -resize 375x -background "#1e1e28" -extent 1100x400 "$COVER"
        if [[ -f "$COVER" ]] ; then

          #printf "\e]20;${COVER};70x70+0+4:op=keep-aspect\a"
          printf "\e]20;${COVER};100x100+0+50:op=keep-aspect\a"
        else
            reset_background
        fi
    else
        reset_background
    fi

    # For Notifications
    if [[ -n "$src" ]] ; then
        # Resize the image's width to 128px
        convert "$src" -resize 400x "$COVER"
        if [[ -f "$COVER" ]] ; then
            #notify-send -u low --icon=~/.config/ncmpcpp/music.png "$(mpc current)"
            notify-send -u low -i ${COVER} "  Now Playing:" "`mpc current`"
        fi
    fi
} &
