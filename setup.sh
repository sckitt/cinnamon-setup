#!/usr/bin/bash

import_wallpaper () {
    sudo cp -r $(pwd)/default.png /usr/share/backgrounds/default.png
}

install_dependencies () {
    sudo apt install gtk2-engines-murrine gtk2-engines-pixbuf sassc optipng inkscape libglib2.0-dev-bin libglib2.0-dev libxml2-utils
}

install_packages () {
    mkdir -p ~/Documents/github

    repos=( https://github.com/vinceliuice/WhiteSur-gtk-theme
            https://github.com/vinceliuice/WhiteSur-icon-theme
            https://github.com/vinceliuice/McMojave-cursors)
    
    for (( i=0; i<=${#repos[@]}; i++ )); do
        if (( ${i} % 2 != 0 )); then
            cd ~/Documents/github
            git clone ${repos[i]} # && cd REPO_FOLDER (TODO)
            ./install.sh
            cd ..
        fi
    done

    # For Ubuntu 20.04
    echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' | sudo tee /etc/apt/sources.list.d/home:manuelschneid3r.list
    curl -fsSL https://download.opensuse.org/repositories/home:manuelschneid3r/xUbuntu_20.04/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_manuelschneid3r.gpg > /dev/null
    sudo apt update
    sudo apt install plank albert
}

install_themes () {
    :
}

import_terminal_settings () {
    :
}

import_cinnamon_settings () {
    :
}

main () {
    #import_wallpaper
    #install_dependencies
    #install_packages
    #install_themes
    #import_terminal_settings
    #import_cinnamon_settings
}

# TODO: automate via GUI, just select distro (Fedora/RedHat, Ubuntu/Mint/Debian, Arch/Manjaro)

main "$@"
