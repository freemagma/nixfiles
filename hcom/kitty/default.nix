{ style, ... }:

{
  programs.kitty = {
    enable = true;
    keybindings = {
      "alt+tab>n" = "new_tab";
      "alt+tab>h" = "previous_tab";
      "alt+tab>l" = "next_tab";
      "alt+tab>shift+h" = "move_tab_backward";
      "alt+tab>shift+l" = "move_tab_forward";
      "alt+tab>c" = "close_tab";
      "alt+tab>1" = "goto_tab 1";
      "alt+tab>2" = "goto_tab 2";
      "alt+tab>3" = "goto_tab 3";
      "alt+tab>4" = "goto_tab 4";
      "alt+tab>5" = "goto_tab 5";
      "alt+tab>6" = "goto_tab 6";
      "alt+1" = "goto_tab 1";
      "alt+2" = "goto_tab 2";
      "alt+3" = "goto_tab 3";
      "alt+4" = "goto_tab 4";
      "alt+5" = "goto_tab 5";
      "alt+6" = "goto_tab 6";

      "alt+enter" = "launch --cwd=current";
      "alt+w>c" = "close_window";
      "alt+w>h" = "neighboring_window left";
      "alt+w>j" = "neighboring_window down";
      "alt+w>k" = "neighboring_window up";
      "alt+w>l" = "neighboring_window right";
      "alt+h" = "neighboring_window left";
      "alt+j" = "neighboring_window down";
      "alt+k" = "neighboring_window up";
      "alt+l" = "neighboring_window right";
      "alt+w>shift+h" = "move_window left";
      "alt+w>shift+j" = "move_window down";
      "alt+w>shift+k" = "move_window up";
      "alt+w>shift+l" = "move_window right";
      "alt+shift+h" = "move_window left";
      "alt+shift+j" = "move_window down";
      "alt+shift+k" = "move_window up";
      "alt+shift+l" = "move_window right";
    };
    settings = with style.color; {
      shell = "zsh";
      enable_audio_bell = "no";
      font_family = "FiraCode Nerd Font";
      font_size = 12;

      scrollback_lines = 10000;

      enabled_layouts = "tall:bias=60;full_size=1;mirrored=false";
      window_margin_width = 4;
      window_padding_width = 4;
      window_border_width = "4px";
      placement_strategy = "top-left";
      active_border_color = purple;
      inactive_border_color = bg2;
      bell_border_color = red;

      tab_bar_style = "slant";

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
