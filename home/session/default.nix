{ config, lib, pkgs, ... }:

{
  imports = [ ./bar.nix ./gtk.nix ./i3.nix ./locker.nix ./picom.nix ./rofi ];
}
