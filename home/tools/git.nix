{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "Antoine Solé";
    userEmail = "antoine.sole@epita.fr";

    signing = {
      key = "BC92 1A64 D3D8 005E 4F47 1E37 A30D 697F B571 E426";
      signByDefault = true;
    };

    lfs = { enable = true; };

    delta = {
      enable = true;
      options = {
        line-numbers = true;
        side-by-side = true;
        syntax-theme = "Dracula";
      };
    };

    ignores = [ "*~" "*.o" ".ccls-cache" ".envrc" ];

    extraConfig = { init = { defaultBranch = "main"; }; };
  };
}
