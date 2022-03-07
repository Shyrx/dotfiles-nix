{ config, lib, pkgs, ... }:

{
  imports = [
    ./rofi
    ./bar.nix
    ./i3.nix
  ];
}
