_: { pkgs, style, config, username, ... }:

{
  home.packages = with pkgs; [ nerdfonts ];

  xsession.windowManager.i3 = {
    enable = true;
    config = rec {
      bars = [ ];
      defaultWorkspace = "workspace number 1";
      fonts = {
        names = [ "Fira Code Nerd Font" ];
        # hacky way to control titlebar height
        size = 6.0;
      };
      window.border = 4;
      gaps.inner = 10;
      modifier = "Mod4";
      colors = with style.color; rec {
        background = base;
        focused = {
          background = lavender;
          border = lavender;
          text = lavender;
          childBorder = lavender;
          indicator = red;
        };
        focusedInactive = focused // {
          background = teal;
          border = teal;
          text = teal;
          childBorder = teal;
        };
        unfocused = focused // {
          background = overlay0;
          border = overlay0;
          text = overlay0;
          childBorder = overlay0;
        };
        urgent = focused // {
          background = red;
          border = red;
          text = red;
          childBorder = red;
        };
        placeholder = unfocused;
      };
      keybindings = {
        # change workspaces
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";
        "${modifier}+0" = "workspace number 10";
        "${modifier}+Shift+Tab" = "workspace back_and_forth";

        # move containers between workspaces
        "${modifier}+Shift+1" = "move container to workspace number 1";
        "${modifier}+Shift+2" = "move container to workspace number 2";
        "${modifier}+Shift+3" = "move container to workspace number 3";
        "${modifier}+Shift+4" = "move container to workspace number 4";
        "${modifier}+Shift+5" = "move container to workspace number 5";
        "${modifier}+Shift+6" = "move container to workspace number 6";
        "${modifier}+Shift+7" = "move container to workspace number 7";
        "${modifier}+Shift+8" = "move container to workspace number 8";
        "${modifier}+Shift+9" = "move container to workspace number 9";
        "${modifier}+Shift+0" = "move container to workspace number 10";

        # change focus
        "${modifier}+h" = "focus left";
        "${modifier}+j" = "focus down";
        "${modifier}+k" = "focus up";
        "${modifier}+l" = "focus right";
        "${modifier}+Tab" = "focus next";
        "${modifier}+a" = "focus parent";
        "${modifier}+Shift+a" = "focus child";

        # move focused window
        "${modifier}+Shift+h" = "move left";
        "${modifier}+Shift+j" = "move down";
        "${modifier}+Shift+k" = "move up";
        "${modifier}+Shift+l" = "move right";

        # manipulating i3 and power
        "${modifier}+Shift+e" = "reload";
        "${modifier}+Shift+Ctrl+e" = "restart";
        "${modifier}+Shift+r" = "exec reboot";
        "${modifier}+Escape" = "exec xfce4-session-logout -l";
        "${modifier}+Shift+Escape" = "exec shutdown now";
        "${modifier}+Shift+c" = "kill";

        # floating things
        "${modifier}+Shift+space" = "floating toggle";

        # layouts
        "${modifier}+e" = "layout toggle split";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+x" = "layout stacking";
        "${modifier}+b" = "fullscreen toggle";
        "${modifier}+s" = "split v";
        "${modifier}+v" = "split h";

        # resize mode
        "${modifier}+r" = ''mode "resize"'';

        # volume control
        "${modifier}+Left" = "exec pamixer -d 5";
        "${modifier}+Right" = "exec pamixer -i 5";
        "${modifier}+Down" = "exec pamixer -t";
        "${modifier}+Shift+Left" = "exec brightnessctl set 10%-";
        "${modifier}+Shift+Right" = "exec brightnessctl set 10%+";
        "${modifier}+Shift+Down" = "exec brightnessctl set 50%";

        # launch things
        "${modifier}+Return" = "exec kitty";
        "${modifier}+f" = "exec firefox";
        "${modifier}+Shift+f" = "exec firefox --private-window";
        "${modifier}+q" = "exec ${pkgs.rofi}/bin/rofi -show drun";

        # script keybindings
        "${modifier}+Shift+s" = ''mode "scripts"'';
      };
      modes = {
        resize = {
          h = "resize shrink width 10 px or 3 ppt";
          j = "resize grow height 10 px or 3 ppt";
          k = "resize shrink height 10 px or 3 ppt";
          l = "resize grow width 10 px or 3 ppt";

          "Shift+h" = "resize shrink width 50 px or 15 ppt";
          "Shift+j" = "resize grow height 50 px or 15 ppt";
          "Shift+k" = "resize shrink height 50 px or 15 ppt";
          "Shift+l" = "resize grow width 50 px or 15 ppt";

          Escape = ''mode "default"'';
        };

        scripts = {
          w = ''exec "resetwifi"; mode "default"'';
          b = ''exec "resetblue B4:CE:40:C2:79:31"; mode "default"'';
          h = ''exec "resetblue 10:29:59:5E:68:9A"; mode "default"'';
          d = ''exec "bluetoothctl -- disconnect"; mode "default"'';
          m = ''exec "maim -s /home/${username}/images/screenshots/$(date -Ins).png"; mode "default"'';

          Escape = ''mode "default"'';
        };
      };
      startup = [
        {
          command = "systemctl --user restart polybar";
          always = true;
          notification = false;
        }
        {
          command = "nitrogen --restore";
          always = true;
          notification = false;
        }
        {
          command = "rm ${config.xdg.configHome}/autostart/teams.desktop";
          always = true;
          notification = false;
        }
      ];
    };
    extraConfig = ''
      smart_borders on
      for_window [class=".*"] title_format " %title"
    '';
  };

  services.picom = {
    enable = true;
    backend = "xrender";
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.kora-icon-theme;
      name = "kora-icon-theme";
    };
    theme = {
      package = pkgs.catppuccin-gtk;
      name = "catppuccin-gtk";
    };
  };
}
