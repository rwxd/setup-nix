{ config, pkgs, ... }: {
  home.packages = with pkgs; [ pass-secret-service ];

  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [
      exts.pass-otp
      exts.pass-update
      exts.pass-import
      # exts.pass-checkup
      exts.pass-genphrase
    ]);
    settings = {
      PASSWORD_STORE_DIR = "$XDG_DATA_HOME/.password-store";
      PASSWORD_STORE_CLIP_TIME = "60";
      PASSWORD_STORE_ENABLE_EXTENSIONS = "true";
    };
  };
}
