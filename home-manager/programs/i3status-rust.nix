{ config, pkgs, ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      bottom = {
        icons = "awesome6";
        theme = "nord-dark";
        blocks = [
          {
            block = "disk_space";
            path = "/";
            alias = "/";
            info_type = "available";
            unit = "GB";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "memory";
            display_type = "memory";
            format_mem = "{mem_used_percents}";
          }
          {
            block = "memory";
            display_type = "swap";
            format_swap = "{swap_used_percents}";
          }
          {
            block = "cpu";
            info = 60.0;
            warning = 80.0;
            critical = 95.0;
            interval = 1;
          }
          {
            block = "load";
            format = "{1m}";
            info = 60.0;
            warning = 80.0;
            critical = 95.0;
            interval = 1;
          }
          {
            block = "sound";
          }
          { block = "time"; format = "%a %d/%m %T"; interval = 5; }
        ];
      };
      top = {
        icons = "awesome6";
        theme = "nord-dark";
        blocks = [
          {
            block = "focused_window";
            max_width = 50;
            show_marks = "visible";
          }
          {
            block = "external_ip";
            format = "{ip} {country_code} {city} {asn}";
          }
          {
            block = "music";
            player = "spotify";
            hide_when_empty = true;
          }
          {
            block = "networkmanager";
            on_click = "alacritty -e nmtui";
            interface_name_exclude = [ "br\-[0-9a-f]{12}" "docker\d+" ];
            interface_name_include = [ ];
            ap_format = "{ssid^10}";
          }
          {
            block = "battery";
            format = "{percentage} {time}";
            interval = 60;
          }
        ];
      };
    };
  };
}
