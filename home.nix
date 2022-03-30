{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Imports configurations from other files/directories
  imports = [
    ./packages.nix
    ./session
    ./software
    ./tools.nix
  ];

  home = {
    username = "shyrx";
    homeDirectory = "/home/shyrx";

    stateVersion = "22.05";

    sessionVariables = {
      EDITOR = "emacs";
    };
  };

  services = {
    blueman-applet.enable = true;
  };
}
