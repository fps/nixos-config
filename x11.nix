{ config, lib, pkgs, ... }:

{ 
  options.nixos-config.x11 = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [ ];

    environment.systemPackages = with pkgs; 
      (lib.mkIf config.nixos-config.x11.enable [
        arandr 
        dmenu 
        lxterminal
        light
        fuzzel
        alacritty
#        xclip
#        gparted
#        kate
#        firefox 
#        thunderbird 
#        signal-desktop
#        vlc
#        keepassxc
#        xfce.xfce4-terminal 
#        slic3r
      ]);

    services.xserver.enable = lib.mkDefault config.nixos-config.x11.enable;
    services.xserver.windowManager.i3.enable = lib.mkDefault config.nixos-config.x11.enable;
    services.displayManager.sddm.enable = lib.mkDefault config.nixos-config.x11.enable;
    services.libinput.enable = lib.mkDefault config.nixos-config.x11.enable;
    programs.niri.enable = lib.mkDefault config.nixos-config.x11.enable;
  };
} 
