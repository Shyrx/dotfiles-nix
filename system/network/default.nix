{ config, lib, pkgs, ... }:

{
  # Trying networkd
  systemd.network.enable = true;

  # systemd-resolved
  services.resolved = {
    enable = true;
    extraConfig = ''
    '';
  };


  dhcpcd.enable = false;
  useNetworkd = true;

  networking = {
    wireless.iwd = {
      enable = true;
      settings = {
        General = {
          EnableNetworkConfiguration=true; # Enable integrated dhcp client
          DisableANQP=false;
          # SystemdEncrypt=""; // TODO search on this
        };
        Network = {
          EnableIPv6=true;
        };
        Settings = {
          AutoConnect=true;
        };
      };
    };
  };
}
