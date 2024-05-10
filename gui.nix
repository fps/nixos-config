{ config, lib, pkgs, ... }:

{ 
  options.nixos-config.gui = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [ ];

    environment.systemPackages = with pkgs; 
      (lib.mkIf config.nixos-config.gui.enable [
        xclip
        gparted
        kate
        firefox 
        thunderbird 
        signal-desktop
        vlc
        keepassxc
        xfce.xfce4-terminal 
        slic3r
      ]);

    services.xserver.enable = config.nixos-config.gui.enable;
    services.xserver.windowManager.i3.enable = config.nixos-config.gui.enable;
    services.xserver.displayManager.sddm.enable = config.nixos-config.gui.enable;
    services.xserver.libinput.enable = config.nixos-config.gui.enable;
  };
} 
