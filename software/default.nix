{ config, lib, pkgs, ... }:

{
  imports = [
    ./flameshot.nix
    ./git.nix
    ./htop.nix
    ./picom.nix
    ./udisk.nix
  ];
}
