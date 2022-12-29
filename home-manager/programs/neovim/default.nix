{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    # package = pkgs.neovim-nightly;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
    extraConfig = ''
	  let g:copilot_node_command = "${pkgs.nodejs-16_x}/bin/node"
	  let PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig"
      luafile ${./init.lua}
    '';

    plugins = with pkgs; [
      # (vimPlugins.nvim-treesitter.withPlugins (plugins: tree-sitter.allGrammars))
      vimPlugins.telescope-fzf-native-nvim
      vimPlugins.packer-nvim
      # vimPlugins.copilot-vim
    ];

    extraPackages = with pkgs; [
      tree-sitter
	  go_1_19
	  gopls
      rust-analyzer
      rustup
      nodePackages.pyright
      gcc
      nodejs
	  nodejs-16_x
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

