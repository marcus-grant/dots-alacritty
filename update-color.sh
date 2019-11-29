#!/bin/bash
# A script that checks current time and depending on the hour will apply...
# ... either a light mode or dark modde color scheme

# Start and end hours of light mode
lightModeStartHr="6"
lightModeEndHr="18"

# Color Mode Schemes
darkModeScheme="base16-gruvbox-dark-medium-256.yml"
# lightModeScheme="base16-belafonte-day.yml"
lightModeScheme="base16-gruvbox-light-medium.yml"
lightModeScheme="base16-gruvbox-light-hard-mod.yml"


# Alacritty Config Root
alacConfRoot="$HOME/.dots/alacritty"
# Alacritty update script command leaving out scheme name denoted by filename
scriptPrefix="$alacConfRoot/alacritty-colorscheme -a"

currentHour="$(date +"%H")"
# for debug only, give one argument for a time to see how it responds at that hour
if [ ! -z $1 ]; then
    currentHour="$1"
fi

# Day mode is lightModeEndHr > current hour >= lightModeStartHr
if { [ "$lightModeEndHr" -gt "$currentHour" ] && [ "$currentHour" -ge "$lightModeStartHr" ]; }; then
    # Light Mode
    $scriptPrefix $lightModeScheme
    # echo "light mode"
else
    # Dark Mode
    $scriptPrefix $darkModeScheme
    # echo "dark mode"
fi

