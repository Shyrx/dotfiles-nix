{ config, pkgs, ... }:

{
  
  # Let home manager manage programs configuration for the shell
  programs.dconf.enable = true;

  home-manager.users.shyrx = {
    home = rec {
      # Home Manager needs a bit of information about you and the
      # paths it should manage.
      username = "shyrx";
      homeDirectory = "/home/${username}";

      enableNixpkgsReleaseCheck = true;

      sessionVariables = {
        EDITOR = "emacs";
        BROWSER = "firefox";
      };

      # This value determines the Home Manager release that your
      # configuration is compatible with. This helps avoid breakage
      # when a new Home Manager release introduces backwards
      # incompatible changes.
      #
      # You can update Home Manager without changing this value. See
      # the Home Manager release notes for a list of state version
      # changes in each release.
      stateVersion = config.system.stateVersion;
    };

    # Let Home Manager install and manage itself.
    programs.home-manager = { enable = true; };
  };
}
