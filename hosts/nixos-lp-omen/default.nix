{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./nvidia.nix
      ../common
    ];

  networking.hostName = "nixos-lp-omen";
}
