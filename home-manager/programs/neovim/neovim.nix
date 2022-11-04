{ config, lib, pkgs, ... }:

let
  neovimConfig = builtins.readFile ./init.vim;
in
{
  programs.neovim = {
    enable = true;
    # package = pkgs.neovim-nightly;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
    extraConfig = neovimConfig;

    plugins = with pkgs; [
      (vimPlugins.nvim-treesitter.withPlugins (plugins: tree-sitter.allGrammars))
      vimPlugins.telescope-fzf-native-nvim
    ];

    extraPackages = with pkgs; [
      tree-sitter
      gopls
      rust-analyzer
      nodePackages.pyright
    ];
  };

  home.file.".config/nvim/" = {
    source = ./config;
    recursive = true;
    executable = true;
  };
}
