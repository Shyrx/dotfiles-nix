{ config, lib, pkgs, ... }:

{
  imports = [ ./x ./shell ./gtk.nix ];
}
