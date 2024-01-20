{ config, options, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    parted
    gparted

    htop
    iotop
    schedtool
    killall
    psmisc
    powertop

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
    zip
    rar

    wget
    links2
    wirelesstools

    bc
    jq

    octaveFull
    gnuplot
    python3

    tmux
    bash-completion

    cryptsetup
    borgbackup
    syncthing

    mplayer

    jack2
    jack-example-tools
  ];
} 
