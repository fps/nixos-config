{ config, lib, pkgs, ... }:

{ 
  imports =
  [
    ./rtnix
    ./make-nixos-fast-again
    ./0vpn

    ./cli.nix
    ./gui.nix
    ./users.nix
    ./common.nix
    ./sound.nix
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (self: super: {
      fixed-ir-lv2 = (pkgs.callPackage ./pkgs/sound/fixed-ir-lv2.nix {});
      fixed-ir-Kalthallen-lv2 = (pkgs.callPackage ./pkgs/sound/fixed-ir-Kalthallen-lv2.nix {});
    })
  ];
} 
