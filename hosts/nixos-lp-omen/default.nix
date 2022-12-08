{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan.
    ../common
  ];

  networking.hostName = "nixos-lp-omen";
}
