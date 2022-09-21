{ options, config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.services.window-managers.bspwm;

in {
  options.modules.services.window-managers.bspwn.enable =
    mkEnableOption "bspwn";

  config = mkIf cfg.enable {

    xsession = {

      enable = true;
      windowManager.bspwm = {

        enable = true;

        monitors = { "DP-0" = [ "1" "2" "3" ]; };

        settings = {
          border_width = 1;
          window_gap = 5;
        };

        rules = {
          "Thunderbird".desktop = "^4";
          "Discord".desktop = "^5";
          "Slack".desktop = "^6";
          "Spotify".desktop = "^7";

          "Morgen".state = "fullscreen";
          "Morgen".hidden = true;
          "Morgen".manage = false;
        };

        startupPrograms = [
          "${pkgs.feh}/bin/feh --bg-scale ~/.config/background.png"
          "${pkgs.betterlockscreen}/bin/betterlockscreen -u ~/.config/lockscreen.png"
          "${pkgs.numlockx}/bin/numlockx on"
          "${pkgs.emacs}/bin/emacs --daemon &"
          "${pkgs.slack}"
          "${pkgs.morgen}"
        ];
      };
    };
  };
}
