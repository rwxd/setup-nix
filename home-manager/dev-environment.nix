{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    git
    neofetch
    gnumake
    jq
    yq
    sshpass
    gnupg
    traceroute
    zsh
    hadolint
    plantuml
    sipcalc
    virtualenv
    wireshark
    tldr
    kind
    kubernetes-helm
    docker
    hugo
    bfg-repo-cleaner
    shfmt
    shellcheck
    fzf
    rustup
    nnn
    github-cli
    glab
    entr
    btop
    python310Packages.pipx
    ripgrep
    kubectl
    argocd
    python3
    poetry
    python3Packages.pip
    python3Packages.pipx
    vault
    powershell
  ];

  imports = [
    ./programs/neovim/neovim.nix
    ./programs/tmux/tmux.nix
    ./programs/vim/vim.nix
    ./programs/k9s/k9s.nix
    ./programs/zsh/zsh.nix
    ./programs/git/git.nix
    ./programs/gnupg/gnupg.nix
  ];
}
