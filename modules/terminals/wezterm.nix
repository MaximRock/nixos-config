{ ... }:

{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
        font = wezterm.font("Noto Color Emoji", {weight="Regular", stretch="Normal", style="Normal"}),
        font_size = 14.0,
        color_scheme = 'Tokyo Night (Gogh)',
        enable_tab_bar = false,
      }
    '';
  };

}