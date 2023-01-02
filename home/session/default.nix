{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bar.nix
    ./gtk.nix
    ./i3.nix
    ./locker.nix
    ./picom.nix
    ./rofi
  ];
}
