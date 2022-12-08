{ options, config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.bluetooth;
in
{
  options.modules.bluetooth.enable = mkEnableOption "bluetooth";

  config = mkIf cfg.enable {
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;

      settings = { # System-wide config (/etc/bluetooth/main.conf)
        General = {
          Enable = "Source,Sink,Media,Socket"; # A2DP profile
        };
      };
    };

    services.blueman.enable = true;

    environment.systemPackages = with pkgs; [
      blueman # Graphical bluetooth manager
      bluez # Bluetooth support for Linux
      bluez-tools # bluetoothctl
      bluez-alsa # Bluez ALSA Backend
    ];
  };
}
