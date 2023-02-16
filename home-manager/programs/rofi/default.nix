{ config, pkgs, ... }:
{
  home.file.".config/rofi/nord.rasi".source = ./nord.rasi;
  home.file.".config/rofi/catppuccin-frappe.rasi".source = ./catppuccin-frappe.rasi;
  home.file.".config/rofi/launcher.rasi".source = ./launcher.rasi;
  home.file.".config/rofi/font.rasi".source = ./font.rasi;
  home.file.".config/rofi/colors.rasi".source = ./colors.rasi;
  home.file.".config/rofi/tokyonight.rasi".source = ./tokyonight.rasi;
  home.file.".config/rofi/onedark.rasi".source = ./onedark.rasi;

  home.file = {
    ".config/rofi/collection".source = pkgs.fetchFromGitHub {
      owner = "adi1090x";
      repo = "rofi";
      rev = "a372d8420f4b411d8847b9281b3d3f3142849962";
      sha256 = "sha256-fMSWCkpdaF+AhiywUWj2e/ZWFnTp3H9/9dBEYkLylkY=";
    };
  };

  programs.rofi = {
    enable = true;
    theme = "tokyonight";
    location = "center";
    pass = {
      enable = true;
      stores = [
		"~/.password-store"
	  ];
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
      # sorting-method = "fzf";
      matching = "fuzzy";
    };
  };
}

