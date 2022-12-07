{ config, lib, pkgs, ... }:

let
  mod = "Mod4";
  logoutMode = "[l]ogout, [p]ower off, [r]eboot";
in {
  xsession.scriptPath = "~/.config/.xsession";

  xsession.windowManager.i3 = {
    package = pkgs.i3-gaps;
    enable = true;
    config = {

      modifier = mod;
      terminal = "alacritty";
      defaultWorkspace = "workspace number 1";
      window.border = 1;
      workspaceAutoBackAndForth = true;

      fonts = {
        names = [ "DejaVuSansMono" "FontAwesome5Free" ];
        size = 11.0;
      };

      focus = {
        followMouse = false;
        mouseWarping = false;
        forceWrapping = false;
      };

      gaps = {
        inner = 8;
        outer = 0;
        smartGaps = true;
      };

      colors = {
        focused = {
          border = "#6272A4";
          background = "#6272A4";
          text = "#F8F8F2";
          indicator = "#6272A4";
          childBorder = "#6272A4";
        };
        focusedInactive = {
          border = "#44475A";
          background = "#44475A";
          text = "#F8F8F2";
          indicator = "#44475A";
          childBorder = "#44475A";
        };
        unfocused = {
          border = "#282A36";
          background = "#282A36";
          text = "#BFBFBF";
          indicator = "#282A36";
          childBorder = "#282A36";
        };
        urgent = {
          border = "#44475A";
          background = "#FF5555";
          text = "#F8F8F2";
          indicator = "#FF5555";
          childBorder = "#FF5555";
        };
        placeholder = {
          border = "#282A36";
          background = "#282A36";
          text = "#F8F8F2";
          indicator = "#282A36";
          childBorder = "#282A36";
        };
        background = "#F8F8F2";
      };

      bars = let
        barConfigPath =
          config.xdg.configFile."i3status-rust/config-top.toml".target;
      in [{
        statusCommand = "i3status-rs ${barConfigPath}";
        position = "top";

        fonts = {
          names = [ "DejaVuSansMono" "FontAwesome5Free" ];
          size = 11.0;
        };
      }];

      startup = [
        {
          command = "${pkgs.feh}/bin/feh --bg-scale ~/.config/background.png";
          always = true;
          notification = true;
        }
        {
          command =
            "${pkgs.betterlockscreen}/bin/betterlockscreen -u ~/.config/lockscreen.png";
          always = true;
          notification = true;
        }
        {
          command = "xbacklight -set 70";
          always = false;
          notification = true;
        }
        {
          command = "${pkgs.numlockx}/bin/numlockx on";
          always = false;
          notification = true;
        }
        {
          command = "${pkgs.i3wsr}/bin/i3wsr --remove-duplicates";
          always = true;
          notification = true;
        }
        {
          command = "${pkgs.emacs}/bin/emacs --daemon &";
          always = false;
          notification = true;
        }
        {
          command = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 40%";
          always = false;
          notification = true;
        }
      ];

      keybindings = lib.mkOptionDefault {

        "${mod}+Return" = "exec alacritty";
        "${mod}+Shift+a" = "kill";

        "${mod}+a" =
          "exec --no-startup-id betterlockscreen -l --off 360, mode default";
        "${mod}+d" = "exec ${pkgs.rofi}/bin/rofi -show run";
        "${mod}+Tab" = "exec ${pkgs.rofi}/bin/rofi -show window";
        "${mod}+f" = "exec firefox";
        "${mod}+x" = "exec emacsclient -c -a 'emacs'";

        "${mod}+Shift+P" = "exec flameshot gui";
        "Print" = "exec flameshot gui";

        "${mod}+space" = "fullscreen";

        "${mod}+Shift+e" = ''mode "${logoutMode}"'';
        "${mod}+Shift+r" = "restart";

        "XF86AudioMute" =
          "exec --no-startup-id wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
        "XF86AudioLowerVolume" =
          "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%-";
        "XF86AudioRaiseVolume" =
          "exec --no-startup-id wpctl set-volume @DEFAULT_AUDIO_SINK@ 4%+";

        "XF86AudioPrev" = "exec --no-startup-id playerctl previous";
        "XF86AudioNext" = "exec --no-startup-id playerctl next";
        "XF86AudioPlay" = "exec --no-startup-id playerctl play-pause";
        "XF86AudioStop" = "exec --no-startup-id playerctl stop";

        "XF86MonBrightnessDown" = "exec xbacklight -dec 5";
        "XF86MonBrightnessUp" = "exec xbacklight -inc 5";
        "${mod}+F1" = "exec xbacklight -dec 5";
        "${mod}+F2" = "exec xbacklight -inc 5";

        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
      };

      modes = let
        makeModeBindings = attrs:
          attrs // {
            "Escape" = "mode default";
            "Return" = "mode default";
          };
      in lib.mkOptionDefault {
        "${logoutMode}" = makeModeBindings {
          "l" = "exec --no-startup-id i3-msg exit, mode default";
          "p" = "exec --no-startup-id systemctl poweroff, mode default";
          "r" = "exec --no-startup-id systemctl reboot, mode default";
        };
      };
    };
    extraConfig = ''
      set $ws1 1
      set $ws2 2
      set $ws3 3
      set $ws4 4
      set $ws5 5
      set $ws6 6
      set $ws7 7
      set $ws8 8
      set $ws9 9
    '';
  };
}
