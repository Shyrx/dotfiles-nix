{ inputs, config, pkgs, lib, ... }:

{

  nix = {
    package = pkgs.nixUnstable;
    readOnlyStore = true;
    extraOptions = ''
        experimental-features = nix-command flakes
      '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    settings = {
      trusted-users = [ "root" "@wheel" ];
      log-lines = 20;
      auto-optimise-store = true;
      warn-dirty = false;
    };


    # Add each flake input as a registry
    # To make nix3 commands consistent with the flake
    registry = lib.mapAttrs (_: value: { flake = value; }) inputs;

    # Map registries to channels
    # Very useful when using legacy commands
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}")
      config.nix.registry;
    
  };
}
