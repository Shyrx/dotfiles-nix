{ config, lib, pkgs, ... }:

{
  services.gpg-agent = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableSshSupport = true;
    pinentryFlavor = "gtk2";
    extraConfig = ''
      allow-emacs-pinentry
    '';
  };

  programs = { gpg = { enable = true; }; };
}
