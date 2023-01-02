{ config, lib, pkgs, ... }:

let
  inherit (lib) recursiveUpdate;
  commonOptions.modules = { desktop = { shell = { zsh.enable = true; }; }; };

  nixosOptions.modules = {
    services = {
      docker.enable = true;
      bluetooth.enable = true;
      network = { network-manager.enable = true; };
    };
    desktop = { x.enable = true; };
  };

  homeManagerOptions.modules = { };
in {
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan.
    ../common
  ];

  modules = recursiveUpdate commonOptions.modules nixosOptions.modules;

  home-manager.users.shyrx.modules =
    recursiveUpdate commonOptions.modules homeManagerOptions.modules;

  networking.hostName = "nixos-latitude";

  users.users.shyrx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  time = {
    timeZone = "Europe/Paris";
    hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr"; # Keyboard layout to use during boot
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}
