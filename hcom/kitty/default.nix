{ style, ... }:

{
  programs.kitty = {
    enable = true;
    settings = with style.color; {
      shell = "zsh";
      enable_audio_bell = "no";
      font_family = "FiraCode Nerd Font";
      font_size = 12;

      scrollback_lines = 10000;

      window_margin_width = 6;

      foreground = fg;
      background = bg;
      selection_foreground = select_fg;
      selection_background = select_bg;

      color0 = color0;
      color1 = color1;
      color2 = color2;
      color3 = color3;
      color4 = color4;
      color5 = color5;
      color6 = color6;
      color7 = color7;
      color8 = color8;
      color9 = color9;
      color10 = color10;
      color11 = color11;
      color12 = color12;
      color13 = color13;
      color14 = color14;
      color15 = color15;
    };
  };
}
