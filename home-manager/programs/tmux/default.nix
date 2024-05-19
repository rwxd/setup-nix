let tmuxConf = builtins.readFile ./tmux.conf;
in {
  programs.tmux = {
    enable = true;
    clock24 = true;
    tmuxp.enable = true;
    sensibleOnTop = true;
    keyMode = "vi";
    prefix = "C-a";
    extraConfig = tmuxConf;
  };
}

