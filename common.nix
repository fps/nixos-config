{ config, lib, ... }:
{
  config = {
    networking.networkmanager.enable = true;
    systemd.services.NetworkManager-wait-online.enable = false;
    networking.useDHCP = false;
    services.openssh.enable = true;

    sound.enable = true;
    
    system.copySystemConfiguration = true;
  };
}
