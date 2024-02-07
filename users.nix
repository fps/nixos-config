{ config, lib, ...}:
{
  config = {
    users.users.fps = {
      isNormalUser = true;
      extraGroups = [ "wheel" "realtime" "networkmanager" "audio" ]; 
    };
  };
}
 
