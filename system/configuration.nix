{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
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

  # Use the systemd-boot EFI boot loader.
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10; # Max number of generation in boot menu
      # consoleMode = "max";
    };
    efi.canTouchEfiVariables = true;
    # generationsDir.enable = true
  };

  boot.initrd.luks.devices.cryptroot = {
    device = "/dev/disk/by-label/nixos";
    preLVM = true;
    allowDiscards = true;
  };

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.wlo1.useDHCP = true;
  networking.interfaces.eno1.useDHCP = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Paris";
  time.hardwareClockInLocalTime = true;

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    # earlySetup = true;
    font = "Lat2-Terminus16";
    keyMap = "fr";
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "fr";
    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
        thunarPlugins = with pkgs.xfce; [ thunar-archive-plugin ];
      };
    };
    windowManager.i3 = {
      package = pkgs.i3-gaps;
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3status
        i3lock
      ];
    };
    displayManager = {
      defaultSession = "xfce+i3";
      autoLogin.enable = true;
      autoLogin.user = "shyrx";
    };
    # Driver for nvidia graphics card, not enable by default
    videoDrivers = [ "nvidia" ];
    # use Glamor for 2D acceleration, if possible
    useGlamor = true;
    # enable touchpad support
    libinput.enable = true;
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
    networkmanagerapplet
    ntfs3g # Used by udiskie
    tlp # Power managment optimization
    udiskie # Auto-mounter for external disk
    vim
    wget
    xorg.xbacklight
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

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
  # More docs
  documentation.dev.enable = true;

  # Logging config for journalctl
  # Log levels are: emerg - alert - crit - err - warning - notice - info - debug
  # Nothing is configured to be redirected to Syslog and Console so they should
  # be useless.
  #
  # Storage=volatile means to store journal data in memory and not on disk.
  # It prevents flushing the data to the disk and thus save boot time
  services.journald.extraConfig = ''
    Storage=volatile
    SystemMaxUse=100M

    MaxLevelWall=emerg # Default = emerg
    MaxLevelKMsg=notice # Default = notice
    MaxLevelStore=warning # Default = debug

    MaxLevelConsole=warning # Default = info
    MaxLevelSyslog=notice # Default = debug
   '';

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?
}

