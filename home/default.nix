{ config, pkgs, ... }:

{
  # Imports configurations from other files/directories
  imports = [ ./packages.nix ./session ./software ./tools ./desktop ];

  services = { blueman-applet.enable = true; };
}
