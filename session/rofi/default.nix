{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    terminal = "alacritty";
    location = "center";

    cycle = true;

    extraConfig = {
      show-icons = false;
      icon-them = "Dracula";
    };

    # themes taken from https://github.com/lr-tech/rofi-themes-collection
    theme = ./launcher.rasi;
  };

  home.file.".config/rofi/rounded-orange-dark.rasi".source = ./rounded-orange-dark.rasi;
  home.file.".config/rofi/colors.rasi".source = ./colors.rasi;
}
