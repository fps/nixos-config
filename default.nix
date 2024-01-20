{ config, pkgs, ... }:

{ 
  nixpkgs.config.allowUnfree = true;

  imports =
  [
    ./rtnix
    ./make-nixos-fast-again
    ./0vpn

    ./common-cli.nix
    ./common-gui.nix
  ];

  nixpkgs.overlays = [
  ];
}

