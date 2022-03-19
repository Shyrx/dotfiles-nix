{ config, lib, pkgs, ... }:

{
  # Enable and
  systemd.network.enable = true;
  useNetworkd = true;

  # systemd-resolved, a systemd DNS resolver daemon
  # Required to obtain DNS adresses from DHCP servers
  services.resolved = {
    enable = true;
  };

  # Need to specify that dhcpcd is disable
  # to use the of internal to networkd
  dhcpcd.enable = false;

  networking = {
    wireless.iwd = {
      enable = true;

      settings = {
        General = {
          EnableNetworkConfiguration=true; # Enable integrated dhcp client
          DisableANQP=false; # Use if Kernel version > 5.3
          # SystemdEncrypt=""; # TODO encrypt password for known network, experimental features, need to set-up by hand
        };
        Network = {
          EnableIPv6=true;
        };
        Settings = {
          AutoConnect=true; # Auto connect to known network
        };
      };
    };
  };


  # FIXME Export iwd env var
}
