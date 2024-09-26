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

    services.xserver.enable = config.nixos-config.x11.enable;
    services.xserver.windowManager.i3.enable = config.nixos-config.x11.enable;
    services.displayManager.sddm.enable = config.nixos-config.x11.enable;
    services.libinput.enable = config.nixos-config.x11.enable;
  };
} 
