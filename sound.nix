{ config, lib, pkgs, ... }:
let
  # pkgs_jack_fix = import /home/fps/src/nix/jackfix/nixpkgs {};
  pkgs_master = pkgs;
  # pkgs_master = import /home/fps/src/nix/master/nixpkgs {};
  lv2_plugin_packages = with pkgs; [
    mda_lv2
    swh_lv2
    aether-lv2
    gxplugins-lv2
    gxmatcheq-lv2
    airwindows-lv2
    rkrlv2 
    # distrho
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
    # ams-lv2
    # bollie-delay
    guitarix
    fixed-ir-Kalthallen-lv2
    fps-faust-plugins-lv2
    fps-plugins-lv2
    neural-amp-modeler-lv2
    jack-wakeup
    # aida-x-lv2
    # melmatcheq-lv2
    # mod-utilities
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
    jack2_db 
    jack2_db_example_tools
    pavucontrol
    alsa-tools
    alsa-utils
    ardour
    carla_2_5_8
    vkeybd
    audacity
    a2jmidid
    lilv
    fixed-ir-lv2
    ladspa-sdk
    dssi
    jalv
    vmpk
    vkeybd
    # ingen
    # rtneural
  ];
in
  { 
    options.nixos-config.sound = {
      enable = lib.mkOption {
        type = lib.types.bool;
        default = false;
      };

      jack = {
        enable = lib.mkOption { type = lib.types.bool; default = false; };
        device = lib.mkOption { type = lib.types.str; default = "hw:USB"; };
        user = lib.mkOption { type = lib.types.str; default = "fps"; };
        period = lib.mkOption { type = lib.types.int; default = 96; };
        nperiods = lib.mkOption { type = lib.types.int; default = 2; };
        midiDriver = lib.mkOption { type = lib.types.str; default = "seq"; };
      };
    };
  
    config = {
      environment.systemPackages = 
        lib.mkIf config.nixos-config.sound.enable (audio_packages ++ lv2_plugin_packages ++ ladspa_plugin_packages);

      environment.variables = lib.mkIf config.nixos-config.sound.enable {
        LV2_PATH = plugin_packages_lv2_dirs;
        LADSPA_PATH = plugin_packages_ladspa_dirs;
      };

      systemd.user.services.jack = lib.mkIf config.nixos-config.sound.jack.enable {
        enable = true;
        description = "Jack server";
        serviceConfig = {
          ExecStart = "${pkgs.jack2}/bin/jackd -S -P 90 -R -d alsa -d ${config.nixos-config.sound.jack.device} -p ${builtins.toString config.nixos-config.sound.jack.period} -n ${builtins.toString config.nixos-config.sound.jack.nperiods} -X ${config.nixos-config.sound.jack.midiDriver}";
        };
      };

      # hardware.pulseaudio.enable = lib.mkIf config.nixos-config.sound.enable true;
      # hardware.pulseaudio.package = pkgs.pulseaudio.override { jackaudioSupport = true; };
      services.pulseaudio.enable = lib.mkIf config.nixos-config.sound.enable true;
      services.pulseaudio.package = pkgs.pulseaudioFull;
    };
  } 
