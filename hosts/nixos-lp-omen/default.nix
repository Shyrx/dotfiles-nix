{ config, lib, pkgs, ... }:

let
  nixosOptions.modules = {
    nvidia.enable = true;
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

}
