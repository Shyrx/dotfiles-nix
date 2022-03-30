{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Antoine Solé";
    userEmail = "antoine.sole@epita.fr";

    lfs = {
      enable = true;
    };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        syntax-theme = "Dracula";
      };
    };
  };
}
