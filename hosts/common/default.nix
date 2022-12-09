{ config, pkgs, ... }:

{
  imports =
    [
      ./boot.nix
      ./home.nix
      ./journald.nix
      ./network
      ./nix.nix
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    firefox
    git
    ntfs3g # Used by udiskie
    tlp # Power managment optimization
    udiskie # Auto-mounter for external disk
    vim
    inxi
  ];

  services = {
    tlp.enable = true;
    openssh.enable = true;
  };
}
