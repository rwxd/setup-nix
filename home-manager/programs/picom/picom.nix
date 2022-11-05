{ config, pkgs, ... }:
{
  services.picom = {
    enable = true;
    settings = {
      corner-radius = 10.0;
      rounded-corners-exclude = [
        "class_g = 'Polybar'"
        "class_g = 'i3bar'"
      ];
      round-borders = 1;
      round-borders-rule = [
        "2:window_type = 'normal'"
      ];
      blur = {
        # method = "kawase";
        strength = 5;
        background = false;
        background-frame = false;
        background-fixed = false;
      };
    };
    fade = true;
    opacityRules = [
      /* "100:class_g ?= 'brave-browser'", */
      "100:fullscreen"
      /* "95:!fullscreen", */
      "90:class_g = 'kitty'"
      "95:class_g = 'Spotify'"
      "95:class_g = 'discord'"
      "95:class_g = 'KeePassXC'"
      "98:class_g = 'Todoist'"
    ];
    backend = "glx";
    vSync = true;
  };
}
