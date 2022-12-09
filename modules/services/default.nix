{ config, lib, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./docker.nix
    ./journald.nix
  ];
}
