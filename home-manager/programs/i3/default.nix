{ config, pkgs, ... }:
let
  i3_mod = "Mod4";
  rofi = "${pkgs.rofi}/bin/rofi";
  kitty = "${pkgs.kitty}/bin/kitty";
in {
  home.packages = with pkgs; [ i3lock ];

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      gaps = {
        inner = 5;
        smartBorders = "on";
      };

      floating = { modifier = i3_mod; };

      window = {
        commands = [{
          command = "border pixel 2";
          criteria = { class = "^.*"; };
        }];
      };

      bars = [
        {
          position = "bottom";
          statusCommand =
            "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-bottom.toml";
          extraConfig = "";
          colors = {
            separator = "#1f222d";
            background = "#1f222d";
            statusline = "#81a1c1";

            focusedWorkspace = {
              border = "#1f222d";
              background = "#1f222d";
              text = "#81a1c1";
            };
            activeWorkspace = {
              border = "#1f222d";
              background = "#252936";
              text = "#5e81ac";
            };
            inactiveWorkspace = {
              border = "#1f222d";
              background = "#1f222d";
              text = "#4c566a";
            };
            urgentWorkspace = {
              border = "#1f222d";
              background = "#1f222d";
              text = "#ee829f";
            };
            bindingMode = {
              border = "#1f222d";
              background = "#81a1c1";
              text = "#2e3440";
            };
          };
        }
        {
          position = "top";
          statusCommand =
            "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
          workspaceButtons = false;
          extraConfig = "";
          colors = {
            separator = "#1f222d";
            background = "#1f222d";
            statusline = "#81a1c1";

            focusedWorkspace = {
              border = "#1f222d";
              background = "#1f222d";
              text = "#81a1c1";
            };
            activeWorkspace = {
              border = "#1f222d";
              background = "#252936";
              text = "#5e81ac";
            };
            inactiveWorkspace = {
              border = "#1f222d";
              background = "#1f222d";
              text = "#4c566a";
            };
            urgentWorkspace = {
              border = "#1f222d";
              background = "#1f222d";
              text = "#ee829f";
            };
            bindingMode = {
              border = "#1f222d";
              background = "#81a1c1";
              text = "#2e3440";
            };
          };
        }
      ];

      modes = {
        resize = {
          "l" = "resize shrink width 10 px or 10 ppt";
          "k" = "resize grow height 10 px or 10 ppt";
          "j" = "resize shrink height 10 px or 10 ppt";
          "h" = "resize grow width 10 px or 10 ppt";
          "odiaeresis" = "resize grow width 10 px or 10 ppt";

          # same bindings, but for the arrow keys
          "Left" = "resize shrink width 10 px or 10 ppt";
          "Down" = "resize grow height 10 px or 10 ppt";
          "Up" = "resize shrink height 10 px or 10 ppt";
          "Right" = "resize grow width 10 px or 10 ppt";

          # back to normal: Enter or Escape or $mod+r
          "Return" = ''mode "default"'';
          "Escape" = ''mode "default"'';
          "${i3_mod}+r" = ''mode "default"'';
        };
      };

      keybindings = {
        # backlight
        "XF86MonBrightnessUp" = "exec brightnessctl set +10%";
        "XF86MonBrightnessDown" = "exec brightnessctl set 10%-";

        # volume control
        "XF86AudioRaiseVolume" =
          "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +5% && $refresh_i3status";
        "XF86AudioLowerVolume" =
          "exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -5% && $refresh_i3status";
        "XF86AudioMute" =
          "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status";
        "XF86AudioMicMute" =
          "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status";

        # spotify player controls
        "XF86AudioPlay" = ''
          exec "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"'';
        "XF86AudioStop" = ''
          exec "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop"'';
        "XF86AudioPrev" = ''
          exec "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"'';
        "XF86AudioNext" = ''
          exec "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"'';

        # locking screen with wallpaper
        "F10" =
          "exec ${pkgs.i3lock}/bin/i3lock --image ~/.i3lock-wallpaper.png --tiling --nofork --color 000000";

        "${i3_mod}+r" = "mode resize";

        # start a terminal
        "${i3_mod}+Return" = "exec ${kitty}";

        # change wallpaper
        "${i3_mod}+o" = "exec feh --bg-fill --random ~/wallpaper/";

        # screenshot
        "Control+Shift+x" = "exec --no-startup-id flameshot gui";

        # screen painting
        "${i3_mod}+F9" = "exec --no-startup-id gromit-mpx -a";

        # start dmenu (a program launcher)
        # "${i3_mod}+d exec --no-startup-id dmenu_run

        # start rofi (a program launcher)
        # "${i3_mod}+d" = "exec --no-startup-id rofi -show drun -config ~/.config/rofi/nord.rasi";
        "${i3_mod}+d" =
          "exec --no-startup-id ${rofi} -show drun -config ~/.config/rofi/config.rasi";
        "${i3_mod}+p" = ''
          exec --no-startup-id bash -c "gopass ls --flat | rofi -dmenu -p gopass | xargs --no-run-if-empty gopass show -o | head -n 1 | xdotool type --clearmodifiers --file -"'';

        # kill focused window
        "${i3_mod}+Shift+q" = "kill";

        # Use Mouse+"${i3_mod} to drag floating windows to their wanted position

        # change focus
        "${i3_mod}+h" = "focus left";
        "${i3_mod}+j" = "focus down";
        "${i3_mod}+k" = "focus up";
        "${i3_mod}+l" = "focus right";

        # alternatively, you can use the cursor keys:
        "${i3_mod}+Left" = "focus left";
        "${i3_mod}+Down" = "focus down";
        "${i3_mod}+Up" = "focus up";
        "${i3_mod}+Right" = "focus right";

        # move focused window
        "${i3_mod}+Shift+h" = "move left";
        "${i3_mod}+Shift+j" = "move down";
        "${i3_mod}+Shift+k" = "move up";
        "${i3_mod}+Shift+l" = "move right";

        # alternatively, you can use the cursor keys:
        "${i3_mod}+Shift+Left" = "move left";
        "${i3_mod}+Shift+Down" = "move down";
        "${i3_mod}+Shift+Up" = "move up";
        "${i3_mod}+Shift+Right" = "move right";

        # split in horizontal orientation
        # "${i3_mod}+h"="split h";

        # split in vertical orientation
        "${i3_mod}+v" = "split v";

        # enter fullscreen mode for the focused container
        "${i3_mod}+f" = "fullscreen toggle";

        # change container layout (stacked, tabbed, toggle split)
        "${i3_mod}+s" = "layout stacking";
        "${i3_mod}+w" = "layout tabbed";
        "${i3_mod}+e" = "layout toggle split";

        # toggle tiling / floating
        "${i3_mod}+Shift+space" = "floating toggle";

        # change focus between tiling / floating windows
        "${i3_mod}+space" = "focus mode_toggle";

        # focus the parent container
        "${i3_mod}+a" = "focus parent";

        # switch to workspace
        "${i3_mod}+1" = "workspace number 1";
        "${i3_mod}+2" = "workspace number 2";
        "${i3_mod}+3" = "workspace number 3";
        "${i3_mod}+4" = "workspace number 4";
        "${i3_mod}+5" = "workspace number 5";
        "${i3_mod}+6" = "workspace number 6";
        "${i3_mod}+7" = "workspace number 7";
        "${i3_mod}+8" = "workspace number 8";
        "${i3_mod}+9" = "workspace number 9";
        "${i3_mod}+0" = "workspace number 10";

        # move focused container to workspace
        "${i3_mod}+Shift+1" = "move container to workspace number 1";
        "${i3_mod}+Shift+2" = "move container to workspace number 2";
        "${i3_mod}+Shift+3" = "move container to workspace number 3";
        "${i3_mod}+Shift+4" = "move container to workspace number 4";
        "${i3_mod}+Shift+5" = "move container to workspace number 5";
        "${i3_mod}+Shift+6" = "move container to workspace number 6";
        "${i3_mod}+Shift+7" = "move container to workspace number 7";
        "${i3_mod}+Shift+8" = "move container to workspace number 8";
        "${i3_mod}+Shift+9" = "move container to workspace number 9";
        "${i3_mod}+Shift+0" = "move container to workspace number 10";

        # move focused workspace between monitors
        "${i3_mod}+m" = "move workspace to output right";
        "${i3_mod}+n" = "move workspace to output left";

        # reload the configuration file
        "${i3_mod}+Shift+c" = "reload";
        # restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
        "${i3_mod}+Shift+r" = "restart";
        # exit i3 (logs you out of your X session)
        "${i3_mod}+Shift+e" =
          "exec i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'";
      };
    };
    extraConfig = ''
      floating_modifier ${i3_mod}
      exec --no-startup-id watch -n 1200 feh --bg-fill --randomize ~/wallpaper/* &>/dev/null &
      exec --no-startup-id "sleep 30; nextcloud"

      # exec_always --no-startup-id picom

      # NetworkManager is the most popular way to manage wireless networks on Linux,
      # and nm-applet is a desktop environment-independent system tray GUI for it.
      exec --no-startup-id nm-applet

      # Blueman
      exec --no-startup-id blueman-applet

      # xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
      # screen before suspend. Use loginctl lock-session to lock your screen.
      exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

      exec "setxkbmap -layout de"
    '';
  };
}
