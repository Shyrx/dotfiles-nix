{ config, lib, pkgs, ... }:

{
  services.picom = {
    enable = true;
    shadow = true;
    shadowExclude = [ "window_type *= 'menu'" ];
  };
}
