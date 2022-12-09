{ config, lib, pkgs, ... }:

{
  imports = [
    ./media
    ./bluetooth.nix
    ./docker.nix
    ./nvidia.nix
    ./x.nix
  ];
}
