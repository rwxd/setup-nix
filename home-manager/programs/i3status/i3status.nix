{ config, pkgs, ... }:
{
  # home.file.".config/i3status/config".source = ./config;

  programs.i3status = {
    enable = true;
    enableDefault = false;
    general = {
      colors = true;
      interval = 5;
      color_good = "#81a1c1"; # Light green
      color_degraded = "#fafe7c"; # Light yellow
      color_bad = "#ff7770"; # Light red
    };
    modules = {
      "disk /" = {
        position = 1;
        settings = {
          format = "/ %avail";
        };
      };

      load = {
        position = 2;
        settings = {
          format = "%1min";
        };
      };

      memory = {
        position = 3;
        settings = {
          format = "%used";
          threshold_degraded = "10%";
          format_degraded = "Memory %free ";
        };
      };

      "path_exists VPN" = {
        position = 4;
        # path exists when a VPN tunnel launched by nmcli/nm-applet is active
        settings = {
          path = "/proc/sys/net/ipv4/conf/tun0";
        };
      };


      # "ethernet eth0" = {
      #   position = 6;
      #   settings = {
      #     format_up = "E: %ip (%speed)";
      #     format_down = "E: down";
      #   };
      # };

      # "volume master" = {
      #   position = 7;
      #   settings = {
      #     format = "\u266a: %volume";
      #     format_muted = "\u266a: muted (%volume)";
      #     device = "default;";
      #     mixer = "Master";
      #     mixer_idx = 0;
      #   };
      # };

      "tztime local" = {
        position = 8;
        settings = {
          format = "%H:%M:%S %d.%m.%Y";
        };
      };

    };
  };
}
