_:

rec {
  color = gruvbox-dark;
  gruvbox-dark = rec {
    fg = fg1;
    bg = bg0;

    bg0 = "#282828";
    bg1 = "#3c3836";
    bg2 = "#504945";
    bg3 = "#665c54";
    bg4 = "#7c6f64";
    bg0_hard = "#1d2021";
    bg0_soft = "#32302f";

    fg0 = "#fbf1c7";
    fg1 = "#ebdbb2";
    fg2 = "#d5c4a1";
    fg3 = "#bdae93";
    fg4 = "#a89984";

    red = "#cc241d";
    bright_red = "#fb4934";

    orange = "#d65d0e";
    bright_orange = "#fe8019";

    yellow = "#d79921";
    bright_yellow = "#fabd2f";

    green = "#98971a";
    bright_green = "#b8bb26";

    cyan = "#689d6a";
    bright_cyan = "#8ec07c";

    blue = "#458588";
    bright_blue = "#83a598";

    purple = "#b16286";
    bright_purple = "#d3869b";

    white = "#a89984";
    bright_white = fg;
    grey = "#928374";
    gray = grey;

    select_fg = bg;
    select_bg = fg;

    dark_bg = bg0_hard;
    dark_fg = gray;

    color0 = bg;
    color1 = red;
    color2 = yellow;
    color3 = green;
    color4 = cyan;
    color5 = blue;
    color6 = purple;
    color7 = white;

    color8 = fg;
    color9 = bright_red;
    color10 = bright_yellow;
    color11 = bright_green;
    color12 = bright_cyan;
    color13 = bright_blue;
    color14 = bright_purple;
    color15 = bright_white;
  };
  custom-dark = rec {
    fg = "#dcd0c7";
    bg = "#151515";
    select_fg = bg;
    select_bg = fg;

    dark_bg = "#050505";
    dark_fg = "#404040";

    red = "#e67e7e";
    bright_red = "#ff4040";

    orange = "#e6bc7e";
    bright_orange = "#ff9f40";

    yellow = "#e6e67e";
    bright_yellow = "#ffff40";

    green = "#7ee67e";
    bright_green = "#40ff40";

    cyan = "#7ee6e6";
    bright_cyan = "#40ffff";

    blue = "#7e7ee6";
    bright_blue = "#4040ff";

    purple = "#e67ee6";
    bright_purple = "#ff40ff";

    white = "#e6e6e6";
    bright_white = "#ffffff";

    color0 = dark_bg;
    color1 = red;
    color2 = yellow;
    color3 = green;
    color4 = cyan;
    color5 = blue;
    color6 = purple;
    color7 = white;

    color8 = dark_fg;
    color9 = bright_red;
    color10 = bright_yellow;
    color11 = bright_green;
    color12 = bright_cyan;
    color13 = bright_blue;
    color14 = bright_purple;
    color15 = bright_white;
  };
}
