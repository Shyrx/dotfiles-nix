{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    terminal = "alacritty";
    location = "center";

    plugins = [
      # TODO search existing plugins
    ];

    cycle = true;

    extraConfig = {
      show-icons = true;
      icon-them = "Dracula";
    };
  };
}
