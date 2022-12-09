{ config, lib, pkgs, ... }:

{
  imports = [
    ./media
    ./network
    ./desktop
    ./bluetooth.nix
    ./docker.nix
    ./nvidia.nix
  ];
}
