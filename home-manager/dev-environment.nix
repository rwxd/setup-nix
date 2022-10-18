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
    ripgrep
    kubectl
    argocd
    poetry
    python3
    python310Packages.pip
    python310Packages.pipx
    python310Packages.virtualenv
    # python3Packages.pip
    # python3Packages.pipx
    vault
    powershell
    terraform
    terragrunt
  ];

  imports = [
    ./programs/neovim/neovim.nix
    ./programs/tmux/tmux.nix
    ./programs/vim/vim.nix
    ./programs/k9s/k9s.nix
    ./programs/zsh/zsh.nix
    ./programs/git/git.nix
    ./programs/gnupg/gnupg.nix
    ./programs/bat/bat.nix
    ./programs/direnv/direnv.nix
  ];
}
