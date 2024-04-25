{ config, lib, pkgs, ... }:
{
  config = {
    boot.loader.timeout = 1;
    networking.networkmanager.enable = true;
    networking.useDHCP = false;

    services.openssh.enable = true;

    system.copySystemConfiguration = true;

    environment.systemPackages = with pkgs; [
      zerovpn 
      vim
      git 
      htop 
      iotop 
      killall 
      psmisc 
      vim 
      man-pages 
      man-pages-posix 
      bash-completion 
      tmux
      cpufrequtils
    ];

    nix.settings.tarball-ttl = 60;
  };
}
