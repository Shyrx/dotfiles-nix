{ options, config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  nvidia = config.modules.hardware.nvidia;
  cfg = config.modules.services.docker;
in
{
  options.modules.services.docker.enable = mkEnableOption "docker";

  config = mkIf cfg.enable {
    virtualisation.docker = {
      enable = true;
      enableNvidia = nvidia.enable;
      enableOnBoot = false;
      
      autoPrune = {
        enable = false;
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
