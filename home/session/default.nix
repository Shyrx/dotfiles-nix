{ config, lib, pkgs, ... }:

{
  imports = [ ./bar.nix ./i3.nix ./locker.nix ./picom.nix ./rofi ];
}
