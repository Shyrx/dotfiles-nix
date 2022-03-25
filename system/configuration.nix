{ config, pkgs, ... }:

{
  imports =
    [
      ./boot.nix
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ./journald.nix
      ./network
      ./nvidia.nix
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
    # earlySetup = true;
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.shyrx = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
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

  # Enable tlp for power managment
  services.tlp.enable = true;
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  # Enable Udisks, a daemon for disks manipulation
  services.udisks2.enable = true;
  # Enable sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  # Enable bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.upower.enable = true;

  # More docs
  documentation.dev.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}

