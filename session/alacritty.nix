{ config, lib, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      font.size = 9;
      window.opacity = 0.7;
      mouse.hide = true;
      window.dynamic_title = true;
    };
  };
}
