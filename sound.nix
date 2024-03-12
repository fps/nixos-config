{ config, lib, pkgs, ... }:

{ 
  options.nixos-config.sound = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    rtnix.enable = true;
    environment.systemPackages = with pkgs; 
      (lib.mkIf config.nixos-config.sound.enable [
        mplayer 
        jack2 
        jack-example-tools
        pavucontrol
        alsaTools
        alsaUtils
        ardour
      ]);
  };
} 
