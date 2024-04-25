{ config, lib, pkgs, ... }:
let
  lv2_plugin_packages = with pkgs; [
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
    fixed-ir-Kalthallen-lv2
    fps-faust-plugins-lv2
    neural-amp-modeler-lv2
    # aida-x-lv2
    # melmatcheq-lv2
  ];

  plugin_packages_lv2_dirs = lib.concatStrings (lib.intersperse ":" (lib.forEach lv2_plugin_packages (x: "${x}/lib/lv2")));

  ladspa_plugin_packages = with pkgs; [
    caps
    blop-ladspa-plugins
  ] 
  # Some LV2 plugins ship with LADSPA versions:
  ++  lv2_plugin_packages;

  plugin_packages_ladspa_dirs = lib.concatStrings (lib.intersperse ":" (lib.forEach ladspa_plugin_packages (x: "${x}/lib/ladspa")));

  audio_packages = with pkgs; [
    mplayer 
    jack2 
    jack-example-tools
    pavucontrol
    alsaTools
    alsaUtils
    ardour
    carla
    vkeybd
    audacity
    a2jmidid
    lilv
    fixed-ir-lv2
    ladspa-sdk
    dssi
    # rtneural
  ];
in
  { 
    options.nixos-config.sound = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };
    };
  
    config = {
      rtnix.enable = lib.mkIf config.nixos-config.sound.enable true;
      environment.systemPackages = 
        lib.mkIf config.nixos-config.sound.enable (audio_packages ++ lv2_plugin_packages ++ ladspa_plugin_packages);

      environment.variables = lib.mkIf config.nixos-config.sound.enable {
        LV2_PATH = plugin_packages_lv2_dirs;
        LADSPA_PATH = plugin_packages_ladspa_dirs;
      };

      # hardware.pulseaudio.enable = lib.mkIf config.nixos-config.sound.enable true;
      # hardware.pulseaudio.package = pkgs.pulseaudio.override { jackaudioSupport = true; };
    };
  } 
