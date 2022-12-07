{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false; # Recommended but not set by default for backward compatibility
        configurationLimit = 10; # Max number of generation in boot menu
      };
      efi.canTouchEfiVariables = true;
      timeout = 5;
    };

    tmpOnTmpfs = true;
    cleanTmpDir = false;
    # Not enough RAM to use this, otherwise it would be great
    # tmpOnTmpfs = true;

    initrd.luks.devices.cryptroot = {
      device = "/dev/disk/by-label/nixos";
      preLVM = true;
      allowDiscards = true;
    };
  };
}
