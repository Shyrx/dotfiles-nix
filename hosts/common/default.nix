{ config, pkgs, ... }:

{
  imports =
    [
      ./boot.nix
      ./home.nix
      ./nix.nix
    ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    firefox
    ntfs3g # Used by udiskie
    tlp # Power managment optimization
    vim
    inxi
  ];

  services = {
    tlp.enable = true;
    openssh.enable = true;
  };
}
