{ config, options, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    htop
    iotop
    schedtools
    killall

    pciutils
    usbutils
    stress

    vim
    emacs

    man-pages
    man-pages-posix

    git
    gdb

    unzip
    unrar
    zip
    rar

    wget
    links2

    bc
    jq

    octaveFull
    python3

    tmux
    bash-completion

    cryptsetup
    borgbackup
    syncthing

    mplayer
  ];
} 
