{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.desktop.shell.zsh;
in
{
  options.modules.desktop.shell.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.enable {
    users.users.shyrx = {
      shell = pkgs.zsh;
    };
  
    environment.pathsToLink = [ "/share/zsh" ];
  };
}
