{ config, lib, pkgs, ... }:

{
  services.betterlockscreen = {
    enable = true;
    inactiveInterval = 5;

    # args is in seconds, 5 * 60 = 360
    arguments = [
      "--off 360"
    ];
  };
}
