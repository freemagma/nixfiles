_: { style, ... }:

{
  programs.kitty = {
    enable = true;
    keybindings = {
      "alt+tab>n" = "new_tab";
      "alt+tab>enter" = "new_tab_with_cwd";
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
      "alt+tab>w" = "detach_window new-tab";
      "alt+tab>shift+w" = "detach_window ask";

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

      "alt+e>e" = "next_layout";
      "alt+e>t" = "goto_layout tall";
      "alt+e>h" = "goto_layout horizontal";
    };
    settings = with style.color; {
      shell = "fish";
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
      font_family = "FiraCode Nerd Font";
      font_size = 12;

      scrollback_lines = 10000;

      enabled_layouts = "tall:bias=50;full_size=1;mirrored=false, horizontal";
      window_padding_width = 4;
      window_border_width = "4px";
      placement_strategy = "center";
      draw_minimal_borders = "no";

      tab_bar_style = "slant";

      foreground = text;
      background = base;
      selection_foreground = base;
      selection_background = rosewater;

      cursor = rosewater;
      cursor_text_color = base;
      url_color = rosewater;

      active_border_color = lavender;
      inactive_border_color = base;
      bell_border_color = yellow;

      active_tab_foreground = crust;
      active_tab_background = mauve;
      inactive_tab_foreground = text;
      inactive_tab_background = mantle;
      tab_bar_background = crust;

      mark1_foreground = base;
      mark1_background = lavender;
      mark2_foreground = base;
      mark2_background = mauve;
      mark3_foreground = base;
      mark3_background = sapphire;

      color0 = surface1;
      color1 = red;
      color2 = green;
      color3 = yellow;
      color4 = blue;
      color5 = pink;
      color6 = teal;
      color7 = subtext1;
      color8 = surface2;
      color9 = red;
      color10 = green;
      color11 = yellow;
      color12 = blue;
      color13 = pink;
      color14 = teal;
      color15 = subtext0;
    };
  };
}
