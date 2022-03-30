{ config, lib, pkgs, ... }:

# FIXME

{
  programs.direnv = {
    enable = true;
    nix-direnv = {
      enable = true;
      enableFlakes = true;
    };
  };
}
