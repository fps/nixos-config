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
      fps-faust-plugins-lv2 = (pkgs.callPackage ./pkgs/sound/fps-faust-plugins-lv2.nix {});
      blop-ladspa-plugins = (pkgs.callPackage ./pkgs/sound/blop-ladspa-plugins.nix {});
      neural-amp-modeler-lv2 = (pkgs.callPackage ./pkgs/sound/neural-amp-modeler-lv2.nix {});
      aida-x-lv2 = (pkgs.callPackage ./pkgs/sound/aida-x.nix {});
      rtneural = (pkgs.callPackage ./pkgs/rtneural.nix {});
    })
  ];
} 
