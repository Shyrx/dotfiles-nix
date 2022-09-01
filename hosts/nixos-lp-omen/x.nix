{ config, lib, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "fr";
    windowManager.i3 = {
      package = pkgs.i3-gaps;
      enable = true;
      # extraPackages = with pkgs; [
      #   dmenu
      #   i3status
      #   i3lock
      # ];
    };
    displayManager = {
      defaultSession = "none+i3";
      autoLogin.enable = true;
      autoLogin.user = "shyrx";
    };
    # use Glamor for 2D acceleration, if possible
    useGlamor = true;
    # enable touchpad support
    libinput.enable = true;
  };
}
