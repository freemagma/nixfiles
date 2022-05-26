_: { config, style, ... }:

{
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "drun,run,window";
    };
    theme =
      let
        lit = config.lib.formats.rasi.mkLiteral;
      in
      {
        "configuration" = {
          font = "Fira Code Nerd Font 10";
          show-icons = lit "true";
          display-drun = "";
          drun-display-format = "{name}";
          disable-history = lit "false";
          sidebar-mode = lit "false";
        };
        "*" = {
          al = lit "#00000000";
          bg = lit style.color.dark_bg;
          fg = lit style.color.fg;
          ac = lit style.color.bright_orange;
        };
        "window" = {
          transparency = "real";
          background-color = lit "@bg";
          text-color = lit "@fg";
          border = lit "0px";
          border-color = lit "@ac";
          border-radius = lit "12px";
          width = lit "30%";
          location = lit "center";
          x-offset = lit "0";
          y-offset = lit "0";
        };
        "prompt" = {
          enabled = lit "true";
          padding = lit "0.30% 1% 0% -0.5%";
          background-color = lit "@al";
          text-color = lit "@fg";
          font = "Fira Code Nerd Font 12";
        };
        "entry" = {
          background-color = lit "@al";
          text-color = lit "@fg";
          placeholder-color = lit "@fg";
          expand = lit "true";
          horizontal-align = lit "0";
          placeholder = "Search";
          padding = lit "0.40% 0% 0% 0%";
          blink = lit "true";
        };
        "inputbar" = {
          children = lit "[ prompt, entry ]";
          background-color = lit "@bg";
          text-color = lit "@fg";
          expand = lit "false";
          border = lit "0% 0% 0% 0%";
          border-radius = lit "0px";
          border-color = lit "@ac";
          margin = lit "0% 0% 0% 0%";
          padding = lit "1.5%";
        };
        "listview" = {
          background-color = lit "@al";
          padding = lit "10px";
          columns = lit "2";
          lines = lit "7";
          spacing = lit "1%";
          cycle = lit "false";
          dynamic = lit "true";
          layout = lit "vertical";
        };
        "mainbox" = {
          background-color = lit "@al";
          border = lit "0% 0% 0% 0%";
          border-radius = lit "0% 0% 0% 0%";
          border-color = lit "@ac";
          children = lit "[ inputbar, listview ]";
          spacing = lit "0%";
          padding = lit "0%";
        };
        "element" = {
          background-color = lit "@al";
          text-color = lit "@fg";
          orientation = lit "horizontal";
          border-radius = lit "0%";
          padding = lit "0.5% 0.5% 0.5% 0.5%";
        };
        "element-icon" = {
          background-color = lit "inherit";
          text-color = lit "inherit";
          horizontal-align = lit "0.5";
          vertical-align = lit "0.5";
          size = lit "24px";
          border = lit "0px";
        };
        "element-text" = {
          background-color = lit "@al";
          text-color = lit "inherit";
          expand = lit "true";
          horizontal-align = lit "0";
          vertical-align = lit "0.5";
          margin = lit "0% 0.25% 0% 0.25%";
        };
        "element selected" = {
          background-color = lit "@ac";
          text-color = lit "@bg";
          border = lit "0% 0% 0% 0%";
          border-radius = lit "12px";
          border-color = lit "@bg";
        };
      };
  };
}
