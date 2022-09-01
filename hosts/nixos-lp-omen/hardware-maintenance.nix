{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
      dmidecode #
      doas # Connect as another user
      hddtemp # Disk temperature
      inxi # Must-have
      ipmitool
      smartmontools
      usbutils # usb
  ];
}
