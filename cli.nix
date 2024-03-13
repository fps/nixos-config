{ config, lib, pkgs, ... }:

{ 
  options.nixos-config.cli = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
    };
  };

  config = {
    nixpkgs.config.allowUnfree = true;
    nixpkgs.overlays = [ ];

    environment.systemPackages = with pkgs; 
      (lib.mkIf config.nixos-config.cli.enable [
        parted 
        schedtool 
        powertop
        pciutils 
        usbutils 
        stress 
        lm_sensors
        emacs
        gdb
        valgrind
        unzip 
        zip 
        rar
        wget 
        links2 
        wirelesstools
        bc 
        jq
        octaveFull 
        gnuplot python3
        cryptsetup 
        borgbackup 
        syncthing
      ]);
  };
} 
