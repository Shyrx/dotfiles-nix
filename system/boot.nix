{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 10; # Max number of generation in boot menu
        # consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
      # generationsDir.enable = true
    };

    initrd.luks.devices.cryptroot = {
      device = "/dev/disk/by-label/nixos";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
