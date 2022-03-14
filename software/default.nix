{ config, lib, pkgs, ... }:

{
  imports = [
    ./udisk.nix
    ./picom.nix
  ];
}
