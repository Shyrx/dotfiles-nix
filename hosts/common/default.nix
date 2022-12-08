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
      ./nvidia.nix
      ./nix.nix
      ./x.nix
    ];

  # Set your time zone.
  time = {
    timeZone = "Europe/Paris";
    hardwareClockInLocalTime = true;
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr"; # Keyboard layout to use during boot
  };

  users.users.shyrx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.zsh;
  };

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

  environment.pathsToLink = [ "/share/zsh" ];

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
