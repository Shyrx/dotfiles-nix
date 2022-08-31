{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Imports configurations from other files/directories
  imports = [
    ./packages.nix
    ./session
    ./software
    ./tools
  ];


  home = {
    username = "shyrx";
    homeDirectory = "/home/shyrx";

    sessionVariables = {
      EDITOR = "emacs";
      BROWSER = "firefox";
      # _JAVA_AWT_WM_NONREPARENTING = 1;
      # DRI_PRIME = 1;
      # __NV_PRIME_RENDER_OFFLOAD = 1;
      # __GLX_VENDOR_LIBRARY_NAME = "nvidia";
      # PROTON_LOG = 1;
      # PROTON_USE_WINED3D = 1;
    };

    stateVersion = "22.05";
  };

  services = {
    blueman-applet.enable = true;
  };
}
