{ config, lib, pkgs, ... }:

{ 
  options.nixos-config.cli_essentials = { 
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
    };
  };

  config = {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [ ];

    environment.systemPackages = with pkgs; 
      (lib.mkIf config.cli_essentials.enable [
        git htop iotop killall psmisc vim man-pages man-pages-posix bash-completion tmux zerovpn
      ]);
  };
} 
