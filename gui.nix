{ config, lib, pkgs, ... }:

{ 
  options.gui = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [ ];

    environment.systemPackages = with pkgs; 
      (lib.mkIf config.gui.enable [
        arandr dmenu xclip

        gparted
    
        kate
    
        firefox thunderbird chromium
    
        signal-desktop
    
        vlc
    
        keepassxc
    
        xfce.xfce4-terminal lxterminal
    
        pavucontrol alsaTools alsaUtils ardour
    
        slic3r
      ]);

    services.xserver.enable = config.gui.enable;
    services.xserver.windowManager.i3.enable = config.gui.enable;
    services.xserver.displayManager.sddm.enable = config.gui.enable;
    services.xserver.libinput.enable = config.gui.enable;
  };
} 
