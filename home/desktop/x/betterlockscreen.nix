{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  x = config.modules.desktop.x;
  cfg = x.betterlockscreen;
in {
  options.modules.desktop.x.betterlockscreen.enable =
    (mkEnableOption "betterlockscreen") // {
      default = x.enable;
    };

  config = mkIf cfg.enable {
    services.betterlockscreen = {
      enable = true;
      inactiveInterval = 5;

      # args is in seconds, 5 * 60 = 360
      arguments = [ "--off 360" ];
    };
  };
}
