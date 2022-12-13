{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.shell.zsh;
in
{
  options.modules.shell.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.enable {
    users.users.shyrx = {
      shell = pkgs.zsh;
    };
  
    environment.pathsToLink = [ "/share/zsh" ];
  };
}
