{ config, options, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    arandr
    dmenu
    xclip

    kate

    firefox
    thunderbird

    vlc

    keepassxc

    xfce.xfce4-terminal
    lxterminal

    pavucontrol
    alsaTools
    alsaUtils
  ];
} 
