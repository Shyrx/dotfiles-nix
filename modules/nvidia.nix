{ options, config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.nvidia;
in
{
  options.modules.nvidia.enable = mkEnableOption "nvidia";

  config = mkIf cfg.enable {
    services.xserver = {
      videoDrivers = [ "nvidia" ];
      dpi = 96; # Set to 143 by default, don't know why
    };

    hardware.opengl.enable = true;
    hardware.opengl.driSupport32Bit = true;

    hardware.nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;

      nvidiaSettings = true;
      nvidiaPersistenced = true;

      prime = {
        sync.enable = false;
        nvidiaBusId = "PCI:1:0:0";
        intelBusId = ""; # FIXME No bus id found using lspci
      };

      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };
}
