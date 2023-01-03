{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.desktop.x;
in {
  options.modules.desktop.x.enable = mkEnableOption "x";

  imports = [ ./betterlockscreen.nix ];
}
