{ config, options, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    htop
    iotop
    schedtool
    killall
    psmisc

    pciutils
    usbutils
    stress
    lm_sensors

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
    wirelesstools

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
