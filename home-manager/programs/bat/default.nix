{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    config = { theme = "catppuccin"; };
    themes = {
      catppuccin = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "f0dedf515c02799b76a2804db9815a479f6c0075";
          sha256 = "0z1pxk21f770xqhd9gxiwls018rla3qg667i6x3z9cjbgwv6mlbi";
        };
        file = "Catppuccin-frappe.tmTheme";
      };
    };
  };
}
