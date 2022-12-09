{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      # Use the systemd-boot EFI boot loader.
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
  };
}
