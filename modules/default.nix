{ config, lib, pkgs, ... }:

{
  imports = [
    ./media
    ./network
    ./desktop
    ./bluetooth.nix
    ./docker.nix
    ./journald.nix
    ./nvidia.nix
  ];
}
