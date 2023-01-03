{ config, lib, pkgs, ... }:

{
  imports = [ ./bar.nix ./i3.nix ./picom.nix ./rofi ];
}
