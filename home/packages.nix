{ pkgs, ... }:

{

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    # Software
    discord
    firefox
    flameshot # screenshot
    gimp
    libreoffice
    morgen
    slack
    spotify # Music
    steam
    teams
    thunderbird
    vlc
    xfce.thunar
    xfce.thunar-archive-plugin

    # Session
    # dunst # Notifications daemon
    # picom # Compositing manager for X servers
    alacritty # tty
    betterlockscreen
    feh # background image
    i3status-rust # bar
    i3wsr # rename workspace
    numlockx
    rofi # Another dmenu
    zsh # Terminal

    # Command line tools
    arandr # window managment
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
    pandoc # Convert documents
    poetry # Venv in better
    qemu # Machine emulator and virtualizer
    ripgrep # Better grep, used for doom
    tree
    unrar
    unzip
    virtualenv
    zip

    # Utils
    font-awesome
    gtk3
    playerctl # Utility for controlling media players
    pre-commit
    maim # For org
    xclip # For org

    binutils
    clang-tools
    bear

    ccls
    editorconfig-core-c
    glslang # For C lsp

    man-pages
    man-pages-posix

    nixfmt

    shellcheck # For better shell coding experience
    shfmt

    rustc
    cargo
    rust-analyzer

    python310
    python310Packages.pyflakes
    python310Packages.isort
    python310Packages.pytest
    python-language-server
    pipenv
    black

    gnupg
    pinentry-curses
  ];
}
