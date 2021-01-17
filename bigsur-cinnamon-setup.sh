deb_install_packages () {
    sudo apt install gtk2-engines-murrine gtk2-engines-pixbuf
    sudo apt install sassc optipng inkscape libglib2.0-dev-bin
}

rpm_install_packages () {
    sudo dnf install gtk-murrine-engine gtk2-engines
    sudo dnf install sassc optipng inkscape glib2-devel
}

arch_install_packages () {
    sudo pacman -S gtk-engine-murrine gtk-engines
    sudo pacman -S sassc optipng inkscape
}

# TODO: sh $(cat $(pwd)/[theme,icons,cursor]/install.sh)

main () {
    case $1 in
        "--debian"|"--ubuntu"|"--mint")
            deb_install_packages
            :;;
        "--fedora"|"redhat")
            rpm_install_packages
            :;;
        "--arch")
            arch_install_packages
            :;;
        *)
            echo "Error parsing option "$1" (option not found)"
    esac
}

main "$@"
