{ config, lib, pkgs, ... }:

{

  networking = {
    hostName = "nixos-lp-omen";

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.wlo1.useDHCP = true;
    interfaces.eno1.useDHCP = true;

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
}
