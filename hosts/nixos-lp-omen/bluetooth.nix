{ config, lib, pkgs, ... }:

{
  hardware.bluetooth = {
    enable = true;

    powerOnBoot = false;

    settings = { # System-wide config (/etc/bluetooth/main.conf)
      General = {
        Enable = "Source,Sink,Media,Socket"; # A2DP profile
      };
    };
  };

  hardware.pulseaudio.extraModules = [
  ];

  services.blueman.enable = true;

  environment.systemPackages = with pkgs; [
    blueman # Graphical bluetooth manager
    bluez # Bluetooth support for Linux
    bluez-tools # bluetoothctl
    bluez-alsa # Bluez ALSA Backend
  ];
}
