{ config, lib, pkgs, ... }:

# Mostly taken from:
# https://github.com/Cobaltarena/nixos-config/blob/master/home/programs/zsh.nix

let
  nix-zsh-completions = {
    name = "nix-zsh-completions";
    src = pkgs.fetchFromGitHub {
      owner = "spwhitt";
      repo = "nix-zsh-completions";
      rev = "468d8cf752a62b877eba1a196fbbebb4ce4ebb6f";
      sha256 = "TWgo56l+FBXssOYWlAfJ5j4pOHNmontOEolcGdihIJs=";
    };
  };

  zsh-nix-shell = {
    name = "zsh-nix-shell";
    file = "nix-shell.plugin.zsh";
    src = pkgs.fetchFromGitHub {
      owner = "chisui";
      repo = "zsh-nix-shell";
      rev = "v0.1.0";
      sha256 = "0snhch9hfy83d4amkyxx33izvkhbwmindy0zjjk28hih1a9l2jmx";
    };
  };
in {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

    plugins = [ zsh-nix-shell nix-zsh-completions ];

    shellAliases = {
      doom = "~/.emacs.d/bin/doom";
      l = "exa -l --git --grid";
      la = "exa -la --git --grid";
      ld = "exa -lD --git --grid";
      nix-search = "nix-env -qaP";
    };

    sessionVariables = {
      "NNTPSERVER" = "snews://news.epita.fr";
      "ZSH_DISABLE_COMPFIX" = "true";
      "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE" = "fg=10";
      "VISUAL" = "emacs";
      "EDITOR" = "emacs";
      "_ZO_RESOLVE_SYMLINKS" =
        "1"; # When set to 1, z will resolve symlinks before adding directories to the database.
    };

    oh-my-zsh = {
      enable = true;
      theme = "half-life";
      plugins = [ "colored-man-pages" "git" "z" "bgnotify" ];
    };
  };
}
