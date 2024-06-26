{ config, pkgs, ... }: {
  services.picom = {
    enable = true;
    backend = "glx";
    vSync = true;
    fade = true;
    fadeDelta = 2;
    shadow = true;
    settings = {
      corner-radius = 10.0;
      rounded-corners-exclude = [ "class_g = 'Polybar'" "class_g = 'i3bar'" ];
      round-borders = 2;
      round-borders-rule = [ "2:window_type = 'normal'" ];
      blur = {
        method = "dual_kawase";
        strength = 5.0;
        deviation = 1.0;
      };
      blur-background-exclude = [ "class_g = 'Gromit-mpx'" ];
    };
    shadowExclude = [ "class_g = 'GromitMPX'" ];
    opacityRules = [
      # "100:class_g ?= 'brave-browser'",
      "100:fullscreen"
      # "95:!fullscreen",
      "90:class_g = 'kitty'"
    ];
  };
}
