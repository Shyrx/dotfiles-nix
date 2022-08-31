{ config, lib, pkgs, ... }:

{
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        savePath = "/home/shyrx/Screen";
        savePathFixed = true;
        filenamePattern = "%F_%Hh%M";
        ignoreUpdateToVersion = "11.0.0";

        uiColor = "#D66B00";

        showHelp = false;
        showDesktopNotification = false;
        disabledTrayIcon = true;

        autoCloseIdDaemon = false;
        startupLaunch = true;
      };
    };
  };
}
