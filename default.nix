{ config, lib, pkgs, ... }:

{ 
  imports =
  [
    ./rtnix
    ./make-nixos-fast-again
    ./0vpn

    ./cli.nix
    ./x11.nix
    ./gui.nix
    ./users.nix
    ./common.nix
    ./sound.nix
  ];

  nixpkgs.config.allowUnfree = true;
  hardware.enableAllFirmware = true;

  nixpkgs.overlays = [
    (self: super: rec {
      fixed-ir-lv2 = (pkgs.callPackage ./pkgs/sound/fixed-ir-lv2.nix {});
      fixed-ir-Kalthallen-lv2 = (pkgs.callPackage ./pkgs/sound/fixed-ir-Kalthallen-lv2.nix {});
      fps-faust-plugins-lv2 = (pkgs.callPackage ./pkgs/sound/fps-faust-plugins-lv2.nix {});
      blop-ladspa-plugins = (pkgs.callPackage ./pkgs/sound/blop-ladspa-plugins.nix {});
      neural-amp-modeler-lv2 = (pkgs.callPackage ./pkgs/sound/neural-amp-modeler-lv2.nix {});
      aida-x-lv2 = (pkgs.callPackage ./pkgs/sound/aida-x.nix {});
      rtneural = (pkgs.callPackage ./pkgs/rtneural.nix {});
      # mod-utilities = (pkgs.callPackage ./pkgs/sound/mod-utilities.nix {});
      jack2_db = (pkgs.callPackage ./pkgs/sound/jackaudio {});
      jack2_db_example_tools = (pkgs.callPackage ./pkgs/sound/jackaudio/tools.nix { jack = jack2_db; });
      carla_2_5_8 = (pkgs.libsForQt5.callPackage ./pkgs/sound/carla { jack2 = self.jack2_db; fluidsynth = super.fluidsynth.override { libjack2 = jack2_db.override { prefix = "lib"; }; }; });
    })
  ];
} 
