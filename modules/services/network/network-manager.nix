{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.services.network.network-manager;
in
{
  options.modules.services.network.network-manager.enable = mkEnableOption "network-manager";

  config = mkIf cfg.enable {
    networking = {
      networkmanager = {
        enable = true;

        # Unstable as of now
        # Pages load weirdly when it's activated. At least on Firefox.
        # wifi.powersave = true;
      };

      # We use networkmanager internal dhcp program
      dhcpcd.enable = false;
    };

    programs.nm-applet.enable = true;
  };
}
