{ config, lib, pkgs, ... }:

{
  imports = [ ./shell ./alacritty.nix ./gtk.nix ];
}
