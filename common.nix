{ config, lib, ... }:
{
  config = {
    boot.loader.timeout = 1;
    networking.networkmanager.enable = true;
    # systemd.services.NetworkManager-wait-online.enable = false;
    networking.useDHCP = false;
    services.openssh.enable = true;

    sound.enable = true;
    rtnix.enable = true;

    zerovpn = {
      client = {
        enable = true;
      };
      serverName = "contabo";
      serverHost = "dfdx.eu";
    };
    
    system.copySystemConfiguration = true;
  };
}
