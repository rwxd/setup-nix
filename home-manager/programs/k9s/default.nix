{ config, pkgs, ... }: {
  home.packages = with pkgs; [ k9s ];

  home.file.".config/k9s/skin.yml".source = ./skin.yml;
  home.file.".config/k9s/plugin.yml".source = ./plugin.yml;
}
