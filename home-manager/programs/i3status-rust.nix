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
            info_type = "available";
            alert_unit = "GB";
            interval = 60;
            warning = 20.0;
            alert = 10.0;
          }
          {
            block = "memory";
            format= " $icon $mem_used_percents.eng(w:1) ";
			format_alt= " $icon_swap $swap_free.eng(w:3,u:B,p:M)/$swap_total.eng(w:3,u:B,p:M)($swap_used_percents.eng(w:2)) ";
			interval = 30;
			warning_mem = 70;
			critical_mem = 90;
          }
          {
            block = "cpu";
          }
          {
            block = "load";
            format = "$icon 1min avg: $1m.eng(w:4)";
            info = 60;
            warning = 80;
            critical = 95;
            interval = 1;
          }
          {
            block = "sound";
          }
          { block = "time"; format = "$icon $timestamp.datetime(f:'%Y-%m-%d %R') "; interval = 5; }
        ];
      };
      top = {
        icons = "awesome6";
        theme = "nord-dark";
        blocks = [
          {
            block = "focused_window";
			format = {
				full = " $title.str(max_w:15) |";
				short = " $title.str(max_w:10) |";
			};
          }
          {
            block = "external_ip";
            format = " $ip $country_code ";
          }
          {
            block = "music";
            player = "spotify";
          }
		  {
			block = "net";
			format = " $icon {$signal_strength $ssid $frequency|Wired connection} via $device ";
			click = [
				{
					button = "left";
					cmd = "alacritty -e nmtui";
				}
			];
		  }
		  {
			block = "xrandr";
			format = " $icon $brightness $resolution ";
		  }
          {
            block = "battery";
			format = " $percentage {$time |}";
			device = "DisplayDevice";
			driver = "upower";
			missing_format = "";
            interval = 60;
          }
        ];
      };
    };
  };
}
