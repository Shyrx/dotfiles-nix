{ config, lib, pkgs, ... }:

{

  # Enable sound
  sound.enable = true;
  # Enable media keys, do not use with desktopManager
  # as they handle it themselves
  sound.mediaKeys.enable = true;

  boot.kernelModules = [ "snd-seq" "snd-rawmidi" ];
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudio.override { jackaudioSupport = true; };
  };

  services.jack = {
    jackd.enable = true;

    # Create ALSA loopack device, instead of using PCM plugin.
    # Has broader application support.
    alsa.enable = false;
    loopback = {
      enable = true;
    };

  };
  users.extraUsers.shyrx.extraGroups = [ "jackaudio" ];
}
