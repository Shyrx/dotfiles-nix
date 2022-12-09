{ config, lib, pkgs, ... }:

let
  nixosOptions.modules = {
    bluetooth.enable = true;
    nvidia.enable = true;
    docker.enable = true;
    desktop = {
      x.enable = true;
    };
  };
    
in {
  imports = [
    ./hardware-configuration.nix # Include the results of the hardware scan.
    ../common
  ];

  modules = nixosOptions.modules;
  
  networking.hostName = "nixos-lp-omen";

  users.users.shyrx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.zsh;
  };
  
  environment.pathsToLink = [ "/share/zsh" ];

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
  system.stateVersion = "22.05"; # Did you read the comment?
}
