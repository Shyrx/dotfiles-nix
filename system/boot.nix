{ config, lib, pkgs, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false; # Recommended but not set by default for backward compatibility
        configurationLimit = 10; # Max number of generation in boot menu
        # consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };

    tmpOnTmpfs = true;
    cleanTmpDir = true;

    initrd.luks.devices.cryptroot = {
      device = "/dev/disk/by-label/nixos";
      preLVM = true;
      allowDiscards = true;
    };
  };

  virtualisation.docker.enableOnBoot = false;
}
