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
  ];

  nixpkgs.config.allowUnfree = true;
} 
