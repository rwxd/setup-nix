{ pkgs, lib, ... }:

let
  p10kInit = builtins.readFile ./p10k-init.zsh;
  zshVars = builtins.readFile ./variables.zsh;
in {
  home.file.".p10k.zsh".source = ./p10k.zsh;

  programs.zsh = {
    enable = true;
    autosuggestion = { enable = true; };
    enableCompletion = true;
    syntaxHighlighting = { enable = true; };

    initExtraFirst = p10kInit;

    initExtraBeforeCompInit = builtins.concatStringsSep "\n"
      [ (lib.strings.fileContents ./completions.zsh) ];

    initExtra = builtins.concatStringsSep "\n" [
      ''
        zmodload zsh/zprof
      ''
      (lib.strings.fileContents ./completions_after_compinit.zsh)
      (lib.strings.fileContents ./functions.zsh)
      (lib.strings.fileContents ./keybindings.zsh)
      (lib.strings.fileContents ./extra_sources.zsh)
      ''
        label="nix-shell"
        if [[ -n "$IN_NIX_SHELL" ]]; then
          if [[ "$name" != "$label" ]]; then
            label="$label:$name"
          fi
          export PS1=$'%{$fg[green]%}'"$label $PS1"
          unset label
        fi
      ''
      ''
        ##########################
        ##### SSH-Agent
        ##########################

        if ! pgrep -u "$USER" ssh-agent > /dev/null; then
            ssh-agent -t 24h > "$XDG_RUNTIME_DIR/ssh-agent.env"
        fi
        if [[ ! "$SSH_AUTH_SOCK" ]]; then
            source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
        fi
      ''
      ''
        eval "$(direnv hook zsh)"
      ''
      "	# Rust openssl fix, https://nixos.wiki/wiki/Rust\n  	export PKG_CONFIG_PATH=\"${pkgs.openssl.dev}/lib/pkgconfig\"\n  "
    ];

    envExtra = zshVars;

    shellAliases = {
      asciicast2gif = "docker run --rm -v $PWD:/data asciinema/asciicast2gif";
      m4b-tool = ''
        docker run -it --rm -u $(id -u):$(id -g) -v "$(pwd)":/mnt sandreas/m4b-tool:latest'';
      petname = "docker run --rm fjolsvin/petname";
      "kswitch" = "source kswitch";
      i3lock = ''bash -c "i3lock -c 000000"'';
      ".." = "cd ..";
      "..." = "cd ...";
      "...." = "cd ....";
      "remove-pacman-orphans" = "pacman -Qtdq | pacman -Rns -";
      "confup" = "home-manager switch";
      "rm" = "trash";
      "werist" = "ipams";
      "k" = "kubectl";
      "benchmark-zsh" = "for i in $(seq 1 10); do time $SHELL -i -c exit; done";
      "download-mp3" =
        "uvx --no-cache --from yt-dlp[default] yt-dlp --extract-audio --audio-format mp3";
    };

    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "powerlevel10k-config";
        file = "p10k.zsh";
        src = lib.cleanSource ./p10k.zsh;
      }
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.5.0";
          sha256 = "0za4aiwwrlawnia4f29msk822rj9bgcygw6a8a6iikiwzjjz0g91";
        };
      }
    ];

    history = {
      ignoreDups = true;
      ignoreSpace = true;
      save = 100000;
      size = 100000;
      share = true;
    };
  };

  programs.zsh.oh-my-zsh = {
    enable = true;

    plugins = [
      "git"
      "sudo"
      "history-substring-search"
      "colored-man-pages"
      "docker"
      "dotenv"
    ];
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}

