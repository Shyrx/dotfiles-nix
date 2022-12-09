{ config, lib, pkgs, ... }:

{
  imports = [
    ./media
    ./network
    ./desktop
    ./nvidia.nix
    ./services
  ];
}
