{ pkgs, ...}:

{

    nixpkgs.config.allowUnfree = true;
    home.packages = with pkgs; [
      # Software
      calibre
      discord
      firefox
      flameshot # screenshot
      gimp
      libreoffice
      slack
      spotify # Music
      steam
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
      zsh # Terminal

      # Tools
      arandr # window managment
      blueman # graphical bluetooth manager
      cmake
      curl
      direnv
      docker
      evince # pdf
      exa # better ls
      fd # faster find, used for doom
      file
      gcc
      gdb
      gnumake
      gnutar
      htop
      inxi
      pandoc # Convert documents
      qemu # Machine emulator and virtualizer
      ripgrep # Better grep, used for doom
      smartmontools
      tree
      unzip
      virtualenv
      zip

      # Utils
      binutils
      bluez # bluetooth
      font-awesome
      gtk3
      man-pages
      man-pages-posix
      numlockx
      playerctl # Utility for controlling media players
      pre-commit
      python3
      unrar

  ];
}
