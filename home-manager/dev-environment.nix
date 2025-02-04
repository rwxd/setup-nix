{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bash
    git
    neofetch
    gnumake
    jq
    yq-go
    sshpass
    gnupg
    zsh
    plantuml
    sipcalc
    wireshark
    tealdeer
    kind
    minikube
    kubernetes-helm
    bfg-repo-cleaner
    shfmt
    shellcheck
    fzf
    rustup
    cargo-watch
    nnn
    github-cli
    glab
    entr
    btop
    ripgrep
    kubectl
    krew
    kubelogin-oidc
    kubeseal
    kustomize
    argocd
    poetry
    python313
    python313Packages.pip
    python313Packages.pipx
    python313Packages.virtualenv
    # python313Packages.google-api-python-client
    vault
    powershell
    terraform
    terragrunt
    go_1_22
    jc
    fd
    gcc
    asdf-vm
    bettercap
    ctop
    glow
    # httpie
    hugo
    tickrs
    openssl
    pkg-config
    jrnl
    chromedriver
    wkhtmltopdf-bin
    k3sup
    todoist
    age
    sops
    azure-cli
    tokei
    cargo-cross
    go-task
    vendir
    pinniped
    gron
    talosctl
    exercism
    d2
    gource
    kompose
    cobra-cli
    dbeaver-bin
    minio-client
    ipinfo
    sqlite-interactive
    sqlite-web
    protobuf
    protoc-gen-go
    fping
    mtr
    ruff
    ruff-lsp
    git-absorb
    nodejs_latest
    cilium-cli
    hubble
    kubeseal
    bruno
    scrcpy
    tailwindcss
    up

    # linters
    tflint
    hadolint
    markdownlint-cli

    # formatters
    stylua
    nixfmt

    uv
  ];

  imports = [
    ./programs/neovim
    ./programs/tmux
    ./programs/vim
    ./programs/k9s
    ./programs/zsh
    ./programs/git
    ./programs/gnupg
    ./programs/bat
    ./programs/direnv
  ];
}
