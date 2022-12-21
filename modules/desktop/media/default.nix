{ config, lib, pkgs, ... }:

{
  imports = [
    ./sound.nix
  ];

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    wireplumber.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pipewire
    wireplumber
  ];
}
