{ config, lib, pkgs, ... }:

{
  imports = [
    ./git.nix
    ./picom.nix
    ./udisk.nix
    ./htop.nix
  ];
}
