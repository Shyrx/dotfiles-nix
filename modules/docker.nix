{ options, config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  nvidia = config.modules.nvidia;
  cfg = config.modules.docker;
in
{
  options.modules.docker.enable = mkEnableOption "docker";

  config = mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      enableNvidia = nvidia.enable;
      enableOnBoot = false;
      
      autoPrune = {
        enable = true;
        dates = "weekly";
        flags = [
          "--all"
          "--volumes"
          "--force"
        ];
      };
    };
  };
}
