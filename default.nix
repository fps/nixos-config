{ config, pkgs, ... }:

{ 
  nixpkgs.config.allowUnfree = true;

  imports =
  [
    ./common-cli.nix
    ./common-gui.nix
  ];

  nixpkgs.overlays = [
  ];
}

