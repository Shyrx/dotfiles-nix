{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
  cfg = config.modules.desktop.shell.zsh;
in {
  options.modules.desktop.shell.zsh.enable = mkEnableOption "zsh";

  config = mkIf cfg.enable {
    programs.zsh = rec {
      enable = true;
      enableAutosuggestions = true;
      enableCompletion = true;

      autocd = true;
      dotDir = ".config/zsh";
      history.path = dotDir + "/history";

      shellAliases = {
        doom = "~/.config/emacs/bin/doom";
        l = "exa -l --git --grid";
        la = "exa -la --git --grid";
        ld = "exa -lD --git --grid";
      };

      oh-my-zsh = {
        enable = true;
        theme = "half-life";
        plugins = [ "colored-man-pages" "git" "z" "bgnotify" ];
      };
    };
  };
}
