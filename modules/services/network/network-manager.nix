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
      };

      # We use networkmanager internal dhcp program
      dhcpcd.enable = false;
    };

    programs.nm-applet.enable = true;
  };
}
