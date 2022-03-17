{ config, lib, pkgs, ... }:

{
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
}
