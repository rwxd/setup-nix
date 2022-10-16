{ pkgs, lib, ... }:

let
  p10kInit = builtins.readFile ./p10k-init.zsh;
in
{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    # initExtra = zshConfig;
    initExtra = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./variables.zsh)
      (lib.strings.fileContents ./functions.zsh)
      (lib.strings.fileContents ./keybindings.zsh)
      (lib.strings.fileContents ./extra_sources.zsh)
      (lib.strings.fileContents ./completions.zsh)
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
    ];

    initExtraBeforeCompInit = p10kInit;

    shellAliases = {
      cat = "bat";
      asciicast2gif = "docker run --rm -v $PWD:/data asciinema/asciicast2gif";
      petname = "docker run --rm fjolsvin/petname";
      "kubeconfig-switcher" = "source kubeconfig-switcher";
      i3lock = "/bin/bash -c \"i3lock\"";
      ".." = "cd ..";
      "..." = "cd ...";
      "...." = "cd ....";
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

  home.file.".p10k.zsh".source = ./p10k.zsh;
}

