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
      show-icons = false;
      icon-them = "Dracula";
    };

    # themes taken from https://github.com/lr-tech/rofi-themes-collection
    theme = ./rounded-orange-dark.rasi;
  };

  home.file.".config/rofi/rounded-common.rasi".source = ./rounded-common.rasi;
}
