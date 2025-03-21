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
      lm_sensors
      iw
      iptables
      cifs-utils
      file
    ];

    nix.settings.tarball-ttl = 60;

    services.fstrim.enable = lib.mkDefault true;

    services.avahi.enable = true;

    services.pipewire.enable = lib.mkForce false;

    zerovpn.serverName = "nionos";
    zerovpn.serverHost = "zerovpn.dfdx.eu";
  };
}
