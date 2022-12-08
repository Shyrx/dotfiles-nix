{ config, lib, pkgs, ... }:

{
  imports = [
    ./docker.nix
    ./nvidia.nix
    ./x.nix
  ];
}
