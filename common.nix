{ config, lib, pkgs, ... }:
{
  config = {
    boot.loader.timeout = 1;

    networking.networkmanager.enable = true;
    networking.useDHCP = false;

    services.openssh.enable = lib.mkDefault true;
    services.openssh.settings.X11Forwarding = lib.mkDefault true;

    boot.tmp.cleanOnBoot = lib.mkDefault true;

    system.copySystemConfiguration = true;

    environment.systemPackages = with pkgs; [
      zerovpn 
      vim
      helix
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
      abduco
    ];

    programs.bash = {
    	interactiveShellInit = ''
    		shopt -s histappend
    	'';
    };
    

    nix.settings.tarball-ttl = 60;

    services.fstrim.enable = lib.mkDefault true;

    services.avahi.enable = true;

    services.pipewire.enable = lib.mkForce false;

    zerovpn.serverName = "nionos";
    zerovpn.serverHost = "zerovpn.dfdx.eu";

    networking.firewall.logRefusedConnections = lib.mkDefault false;
  };
}
