{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
    extraConfig = ''
      	  let g:copilot_node_command = "${pkgs.nodejs-18_x}/bin/node"
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
      go_1_22
      gopls
      rust-analyzer
      rustup
      nodePackages.pyright
      gcc
      nodejs
      nodejs-18_x
      python3
      python3Packages.pip
      jdk
      plantuml
      graphviz
      ruff-lsp
      ruff
      lua-language-server
      stylua
      phpactor
      neocmakelsp
      djlint
      tailwindcss-language-server
      htmx-lsp
      vscode-langservers-extracted
    ];
  };

  home.file.".config/nvim/" = {
    source = ./config;
    recursive = true;
    executable = true;
  };
}

