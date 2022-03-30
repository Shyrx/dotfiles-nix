{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./bar.nix
    ./i3.nix
    ./locker.nix
    ./picom.nix
    ./rofi
    ./zsh.nix
  ];
}
