# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules =
    [ "xhci_pci" "thunderbolt" "vmd" "ahci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  boot.initrd.luks.devices.cryptroot = {
    device = "/dev/disk/by-label/cryptroot";
    preLVM = true;
    allowDiscards = true;
  };

  fileSystems."/" = {
    device = "/dev/disk/by-uuid/a84453d9-ba94-4bd7-bf1f-7d8c2aae3347";
    fsType = "ext4";
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/984A-F8FD";
    fsType = "vfat";
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/fa2e6a58-7b3d-4458-8c7f-f9e744916024"; }];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp43s0.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp0s20f3.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}