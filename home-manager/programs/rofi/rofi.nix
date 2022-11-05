{ config, pkgs, ... }:
{
  home.file.".config/rofi/nord.rasi".source = ./nord.rasi;
  home.file.".config/rofi/catppuccin-frappe.rasi".source = ./catppuccin-frappe.rasi;

  programs.rofi = {
    enable = true;
    theme = "catppuccin-frappe";
    location = "center";
    pass = {
      enable = true;
      stores = [ ];
    };
    terminal = "${pkgs.kitty}/bin/kitty";
    plugins = with pkgs; [
      rofi-vpn
      rofi-rbw
      rofi-calc
      rofi-menugen
      rofi-emoji
      rofi-systemd
      rofi-power-menu
      rofi-pulse-select
      rofi-file-browser
    ];
    extraConfig = {
      modi = "drun,run,filebrowser";
      combi-modi = "drun,run";
      drun-display-format = "{icon} {name}";
      sidebar-mode = true;
      drun-show-actions = true;
      show-icons = true;
      sort = true;
      sorting-method = "fzf";
      matching = "fuzzy";
    };
  };
}

