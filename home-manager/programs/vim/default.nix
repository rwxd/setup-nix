let vimConfig = builtins.readFile ./vimrc;
in {
  programs.vim = {
    enable = true;
    extraConfig = vimConfig;
  };
}
