{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages
      (ps: with ps; [ rustup zlib openssl.dev pkg-config plantuml ]);
    extensions = with pkgs.vscode-extensions; [
      jebbs.plantuml
      catppuccin.catppuccin-vsc
      asvetliakov.vscode-neovim
      yzhang.markdown-all-in-one
      zhuangtongfa.material-theme
      redhat.vscode-yaml
      redhat.vscode-xml
      rust-lang.rust-analyzer
      ms-vscode-remote.remote-ssh
      ms-vscode.makefile-tools
      editorconfig.editorconfig
      mkhl.direnv
    ];
  };
}
