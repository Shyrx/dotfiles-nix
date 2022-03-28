{ pkgs, ...}:

{

    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      # Software
      discord
      firefox
      flameshot # screenshot
      gimp
      slack
      spotify # Music
      teams
      thunderbird
      vlc
      xfce.thunar
      xfce.thunar-archive-plugin

      # Session
      alacritty # tty
      betterlockscreen
      # dunst # Notifications daemon
      feh # background image
      i3status-rust # bar
      i3wsr # rename workspace
      # picom # Compositing manager for X servers
      rofi # Another dmenu
      zsh

      # Tools
      arandr # window managment
      blueman # graphical bluetooth manager
      cmake
      curl
      docker
      evince # pdf
      fd # faster find, used for doom
      gcc
      gnumake
      gnutar
      htop
      pandoc # Convert documents
      qemu # Machine emulator and virtualizer
      ripgrep # Better grep, used for doom
      tree
      unzip
      virtualenv
      zip
      file
      inxi
      smartmontools

      # Utils
      binutils
      bluez # bluetooth
      font-awesome
      gtk3
      man-pages
      man-pages-posix
      numlockx
      playerctl # Utility for controlling media players
      python3
      unrar

  ];
}
