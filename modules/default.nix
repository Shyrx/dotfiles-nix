{ config, lib, pkgs, ... }:

{
  imports = [
    ./media
    ./desktop
    ./bluetooth.nix
    ./docker.nix
    ./nvidia.nix
  ];
}
