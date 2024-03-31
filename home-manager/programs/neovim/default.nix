{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    # package = pkgs.neovim-nightly;
    withNodeJs = true;
    withPython3 = true;
    withRuby = false;
    extraConfig = ''
      	  let g:copilot_node_command = "${pkgs.nodejs-18_x}/bin/node"
      	  let PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig"

      	  let g:rwxd_qf_l = 0
      	  let g:rwxd_qf_g = 0

      	  fun! ToggleQFList(global)
      		if a:global
      			if g:rwxd_qf_g == 1
      				let g:rwxd_qf_g = 0
      				cclose
      			else
      				let g:rwxd_qf_g = 1
      				copen
      			end
      		else
      			if g:rwxd_qf_l == 1
      				let g:rwxd_qf_l = 0
      				lclose
      			else
      				let g:rwxd_qf_l = 1
      				lopen
      			end
      		endif
      	  endfun

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
    ];
  };

  home.file.".config/nvim/" = {
    source = ./config;
    recursive = true;
    executable = true;
  };
}

