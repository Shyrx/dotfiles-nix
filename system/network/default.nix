{ config, lib, pkgs, ... }:

{

  imports = [
    #./networkd.nix
    ./network-manager.nix
  ];
}
