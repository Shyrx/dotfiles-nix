{ options, config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.desktop.x;
in
{
  options.modules.desktop.x.enable = mkEnableOption "x";

  config = mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver = {
      enable = true;
      layout = "fr";
      windowManager.i3 = {
        package = pkgs.i3-gaps;
        enable = true;
      };
      displayManager = {
        defaultSession = "none+i3";
        autoLogin.enable = true;
        autoLogin.user = "shyrx";
      };
      # use Glamor for 2D acceleration, if possible
      useGlamor = true;
      # enable touchpad support
      libinput.enable = true;
    };
  };
}
