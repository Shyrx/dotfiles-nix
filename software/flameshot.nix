{ config, lib, pkgs, ... }:

{
  services.flameshot = {
    enable = true;

    settings = {
      General = {
        savePath = ~/Screen;
        filenamePattern = "%F_%Hh%M";

        showHelp = false;
        showDesktopNotification = false;
        disableTrayIcon = true;

        autoCloseIdDaemon = false;
        startupLaunch = true;
      };
    };
  };
}
