{ config, lib, pkgs, ... }:

{
  sound = {
    enable = false; # Handled by pipewire
    mediaKeys.enable = true; # If no desktop manager
  };
  
  services.pipewire = {
    alsa.enable = true;
    jack.enable = true;
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
