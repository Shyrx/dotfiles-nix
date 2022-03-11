{ pkgs, ...}:

{

  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    alacritty # tty
    arandr # window managment
    betterlockscreen
    binutils
    blueman # graphical bluetooth manager
    bluez # bluetooth
    clang-tools
    cmake
    discord
    docker
    evince # pdf
    fd # faster find, used for doom
    feh # background image
    flameshot # screenshot
    font-awesome
    gcc
    gnumake
    gnutar
    i3status-rust # bar
    i3wsr # rename workspace
    man-pages
    man-pages-posix
    pandoc # convert documents
    python3
    qemu # machine emulator and virtualizer
    ripgrep # better grep, used for doom
    rofi # another dmenu
    slack
    spotify # Music
    teams
    thunderbird
    tree
    unzip
    virtualenv
    zip
    zsh
  ];

}
