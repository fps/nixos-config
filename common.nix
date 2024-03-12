{ config, lib, pkgs, ... }:
{
  config = {
    boot.loader.timeout = 1;
    networking.networkmanager.enable = true;
    # systemd.services.NetworkManager-wait-online.enable = false;
    networking.useDHCP = false;
    services.openssh.enable = true;

    sound.enable = true;
    rtnix.enable = true;
    
    system.copySystemConfiguration = true;

    environment.systemPackages = with pkgs; [
      zerovpn vim
    ];
  };
}
