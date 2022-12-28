{ config, options, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    arandr
    xclip
    kate
    firefox
    thunderbird
    vlc
    pavucontrol
    alsaTools
    alsaUtils
    keepassxc
  ];
} 
