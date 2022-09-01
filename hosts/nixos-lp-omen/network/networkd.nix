{ config, lib, pkgs, ... }:

{
  # Enable networkd
  systemd.network.enable = true;

  # systemd-resolved, a systemd DNS resolver daemon
  # Required to obtain DNS adresses from DHCP servers
  services.resolved = {
    enable = true;
  };

  networking = {
    useDHCP = false;
    useNetworkd = true;
    dhcpcd.enable = false;

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

  networking.interfaces.wlo1.useDHCP = true;
  networking.interfaces.eno1.useDHCP = true;

 # systemd.network.networks = {
 #   "20-wired" = {
 #     enable = true;
 #     DHCP = "yes";
 #     matchConfig = {
 #       Name="eno*";
 #     };
 #     dhcpV4Config = {
 #       RouteMetric = 10;
 #     };
 #     networkConfig = {
 #       IPv6PrivacyExtensions = "kernel";
 #     };
 #   };
 #   "20-wireless" = {
 #     enable = true;
 #     DHCP = "yes";
 #     matchConfig = {
 #       Name="wlan*";
 #     };
 #     dhcpV4Config = {
 #       RouteMetric = 20;
 #     };
 #     networkConfig = {
 #       IgnoreCarrierLoss = "3s";
 #       IPv6PrivacyExtensions = "kernel";
 #     };
 #   };
 #   "20-vbox" = {
 #     enable = true;
 #     DHCP = "no";
 #     matchConfig = {
 #       Name="vbox*";
 #     };
 #     networkConfig = {
 #       IPv6PrivacyExtensions = "kernel";
 #       Address= "192.168.56.1/24";
 #     };
 #     linkConfig = {
 #       RequiredForOnline = "no";
 #     };
 #   };
 # };

  # Wait for any interface to become available, not for all
  systemd.services."systemd-networkd-wait-online".serviceConfig.ExecStart = [
    "" "${config.systemd.package}/lib/systemd/systemd-networkd-wait-online --any"
  ];

  # FIXME Restart iwd services when leaving hibernate/lock-state
}
