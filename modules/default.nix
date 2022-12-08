{ config, lib, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./docker.nix
    ./nvidia.nix
    ./x.nix
  ];
}
