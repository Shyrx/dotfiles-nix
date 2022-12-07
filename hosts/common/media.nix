{ config, lib, pkgs, ... }:

{
  sound = {
    enable = false;
    # Enable media keys, do not use with desktopManager
    # as they handle it themselves
    mediaKeys.enable = true;
  };
  
# rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;

    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
    
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
