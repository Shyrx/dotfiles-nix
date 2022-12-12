{ config, lib, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./network
    ./docker.nix
    ./journald.nix
  ];
}
