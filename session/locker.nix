{ config, lib, pkgs, ... }:

# FIXME Doesn't seem to be working
{
  services.screen-locker = {
    enable = true;
    inactiveInterval = 1;
    lockCmd = "${pkgs.betterlockscreen}/bin/betterlockscreen -l";

    xautolock = {
      enable = true;
      package = pkgs.betterlockscreen;
      detectSleep = true;
    };

    xss-lock.package = pkgs.betterlockscreen;
  };
}
