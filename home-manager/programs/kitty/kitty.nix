let
  kittyConfig = builtins.readFile ./kitty.conf;
in
{

  programs.kitty = {
    enable = true;
    extraConfig = kittyConfig;
  };
}
