{ config, pkgs, ... }:

{
  imports =
    [
      ./bluetooth.nix
      ./boot.nix
      ./home.nix
      ./journald.nix
      ./media.nix
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

  virtualisation.docker.enable = true;

  services = {
    tlp.enable = true;
    openssh.enable = true;
    udisks2.enable = true;
  };

    # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}
