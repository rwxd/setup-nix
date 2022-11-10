{ pkgs, lib, ... }:

let
  p10kInit = builtins.readFile ./p10k-init.zsh;
  zshVars = builtins.readFile ./variables.zsh;
in
{
  home.file.".p10k.zsh".source = ./p10k.zsh;

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    # initExtra = zshConfig;
    initExtra = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./functions.zsh)
      (lib.strings.fileContents ./keybindings.zsh)
      (lib.strings.fileContents ./extra_sources.zsh)
      (lib.strings.fileContents ./completions.zsh)
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
    ];

    initExtraFirst = p10kInit;

    envExtra = zshVars;

    shellAliases = {
      asciicast2gif = "docker run --rm -v $PWD:/data asciinema/asciicast2gif";
      petname = "docker run --rm fjolsvin/petname";
      "kubeconfig-switcher" = "source kubeconfig-switcher";
      i3lock = "bash -c \"i3lock -c 000000\"";
      ".." = "cd ..";
      "..." = "cd ...";
      "...." = "cd ....";
      "remove-pacman-orphans" = "pacman -Qtdq | pacman -Rns -";
      "confup" = "home-manager switch";
      "rm" = "trash";
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
        # will source zsh-autosuggestions.plugin.zsh
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.4.0";
          sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
        };
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.6.0";
          sha256 = "0zmq66dzasmr5pwribyh4kbkk23jxbpdw4rjxx0i7dx8jjp2lzl4";
        };
        file = "zsh-syntax-highlighting.zsh";
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

