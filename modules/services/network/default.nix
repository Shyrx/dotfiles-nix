{ config, lib, pkgs, ... }:

{
  imports = [
    ./network-manager.nix
    #./networkd.nix
  ];
  
  networking = {
    useDHCP = true;
  };
}
