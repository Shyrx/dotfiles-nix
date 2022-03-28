{ config, lib, pkgs, ... }:

{

  networking = {
    hostName = "nixos";

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.wlo1.useDHCP = true;
    interfaces.eno1.useDHCP = true;

    networkmanager = {
      enable = true;

      wifi.powersave = true;
    };

    # We use networkmanager internal dhcp program
    dhcpcd.enable = false;

  };

  programs.nm-applet.enable = true;

  # # Wait for any interface to become available, not for all
  # systemd.services."NetworkManager-wait-online".serviceConfig.ExecStart = [
  #   "" "${config.systemd.package}/lib/systemd/networkmanager-wait-online FIXME"
  # ];

}
