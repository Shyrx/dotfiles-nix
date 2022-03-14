{ config, lib, pkgs, ... }:

# Packages udiskie and ntfs3g must be added system wide otherwise they do not
# enough permissions to mount/unmount disks.

{
  services.udiskie = {
    enable = true;
  };
}
