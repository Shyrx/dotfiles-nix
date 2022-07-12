{ config, pkgs, ... }:

{
  imports =
    [
      ./bluetooth.nix
      ./boot.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./journald.nix
      ./network
      ./nvidia.nix
      ./sound.nix
      ./x.nix
    ];

  nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
        experimental-features = nix-command flakes
      '';
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
    # Detects files with identical content in store and replace them with hard links to a single copy
    autoOptimiseStore = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Paris";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fr"; # Keyboard layout to use during boot
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shyrx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    emacs
    firefox
    git
    glibc
    ntfs3g # Used by udiskie
    tlp # Power managment optimization
    udiskie # Auto-mounter for external disk
    vim
    xorg.xbacklight
  ];

  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
   };
  users.extraGroups.vboxusers.members = [ "shyrx" ];

  environment.pathsToLink = [ "/share/zsh" ];

  virtualisation.docker.enable = true;


  # Enable tlp for power managment
  services.tlp.enable = true;
  services.upower.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Enable Udisks, a daemon for disks manipulation
  services.udisks2.enable = true;

  # Let home manager manage programs configuration for the shell
  programs.dconf.enable = true;

    # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}

