{ config, options, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    arandr
    dmenu
    xclip

    kate

    firefox
    thunderbird
    chromium

    signal-desktop

    vlc

    keepassxc

    xfce.xfce4-terminal
    lxterminal

    pavucontrol
    alsaTools
    alsaUtils
  ];

  services.xserver.enable = true;
  services.xserver.windowManager.i3.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.libinput.enable = true;
} 
