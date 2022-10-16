{ pkgs, ... }:

let
  neovimConfig = builtins.readFile ./init.vim;
in
{
  programs.neovim = {
    enable = true;
    # package = pkgs.neovim-nightly;
    vimAlias = true;
    viAlias = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
    extraConfig = neovimConfig;

    plugins = [
      (pkgs.vimPlugins.nvim-treesitter.withPlugins (plugins: pkgs.tree-sitter.allGrammars))
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
