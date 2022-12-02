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
    # extraConfig = neovimConfig;
    extraConfig = ''
      luafile ${./init.lua}
    '';

    plugins = with pkgs; [
      # (vimPlugins.nvim-treesitter.withPlugins (plugins: tree-sitter.allGrammars))
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.packer-nvim
    ];

    extraPackages = with pkgs; [
      tree-sitter
      gopls
      rust-analyzer
      rustup
      nodePackages.pyright
      gcc
      nodejs
      python3
      python3Packages.pip
      sumneko-lua-language-server
    ];
  };

  home.file.".config/nvim/" = {
    source = ./config;
    recursive = true;
    executable = true;
  };
}

