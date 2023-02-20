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
    pavucontrol
    alsaTools
    alsaUtils
    keepassxc
    xfce.xfce4-terminal
    lxterminal
  ];
} 
