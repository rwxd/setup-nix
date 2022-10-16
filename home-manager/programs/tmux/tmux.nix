let
  tmuxConf = builtins.readFile ./tmux.conf;
in
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    tmuxp.enable = true;
    sensibleOnTop = true;
    # Automatically spawn a session if trying to attach and none are running.
    newSession = true;
    keyMode = "vi";
    prefix = "C-a";
    extraConfig = tmuxConf;
  };
}


