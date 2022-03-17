{ config, lib, pkgs, ... }:

{
  services.picom = {
    enable = false;
    shadow = false;
  };
}
