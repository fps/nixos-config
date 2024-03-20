{ config, lib, pkgs, ... }:
let
  plugin_packages = with pkgs; [
    mda_lv2
    swh_lv2
    aether-lv2
    gxplugins-lv2
    gxmatcheq-lv2
    airwindows-lv2
    rkrlv2 distrho
    bshapr
    bchoppr
    plujain-ramp
    mod-distortion
    x42-plugins
    # infamousPlugins 
    mooSpace
    boops
    eq10q
    talentedhack
    artyFX
    fverb
    kapitonov-plugins-pack
    fomp
    molot-lite
    zam-plugins
    lsp-plugins
    calf
    ams-lv2
    # bollie-delay
    guitarix
    # melmatcheq-lv2
  ];
    plugin_packages_lv2_dirs = lib.concatStrings (lib.intersperse ":" (lib.forEach plugin_packages (x: "${x}/lib/lv2")));

 in
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

      environment.variables = {
        LV2_PATH = plugin_packages_lv2_dirs;
      };
    };
  } 
