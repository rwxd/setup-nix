let
  kittyConfig = builtins.readFile ./kitty.conf;
in
{
  # home.file.".config/kitty/kitty.conf".source = ./kitty.conf;
  programs.kitty = {
    enable = true;
    extraConfig = kittyConfig;
  };
}
