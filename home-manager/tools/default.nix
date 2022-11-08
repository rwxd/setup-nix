{ config, pkgs, ... }:
{
  home.file.".local/bin/" = {
    source = ../../home-manager/tools;
    recursive = true;
    executable = true;
  };
}
