{ config, lib, pkgs, ... }:

{
  imports = [
    ./alacritty.nix
    ./rofi
    ./bar.nix
    ./i3.nix
    ./locker.nix
    ./zsh.nix
  ];
}
