_: { config, style, ... }:

{
  programs.rofi = {
    enable = true;
    extraConfig = {
      modi = "drun,run,window";
    };
    theme = with style.color;
      let
        lit = config.lib.formats.rasi.mkLiteral;
      in
      {
        "configuration" = {
          modi = "run,drun,window";
          icon-theme = "Oranchelo";
          show-icons = lit "true";
          terminal = "alacritty";
          drun-display-format = "{icon} {name}";
          location = lit "0";
          disable-history = lit "false";
          hide-scrollbar = lit "true";
          display-drun = "   Apps ";
          display-run = "   Run ";
          display-window = " 﩯  Window";
          sidebar-mode = lit "true";
        };
        "*" = {
          bg-col = lit mantle;
          bg-col-light = lit mantle;
          border-col = lit mantle;
          selected-col = lit mantle;
          accent = lit blue;
          fg-col = lit text;
          fg-col2 = lit red;
          fg-accent = lit crust;
          grey = lit overlay0;
          width = lit "600";
          font = "Fira Code Nerd Font 10";
        };
        "element-text, element-icon, mode-switcher" = {
          background-color = lit "inherit";
          text-color = lit "inherit";
        };
        "window" = {
          height = lit "360px";
          border = lit "3px";
          border-color = lit "@border-col";
          background-color = lit "@bg-col";
        };
        "mainbox" = {
          background-color = lit "@bg-col";
        };
        "inputbar" = {
          children = lit "[prompt,entry]";
          background-color = lit "@bg-col";
          border-radius = lit "5px";
          padding = lit "2px";
        };
        "prompt" = {
          background-color = lit "@accent";
          padding = lit "6px";
          text-color = lit "@fg-accent";
          border-radius = lit "3px";
          margin = lit "20px 0px 0px 20px";
        };
        "textbox-prompt-colon" = {
          expand = lit "false";
          str = ":";
        };
        "entry" = {
          padding = lit "6px";
          margin = lit "20px 0px 0px 10px";
          text-color = lit "@fg-col";
          background-color = lit "@bg-col";
        };
        "listview" = {
          border = lit "0px 0px 0px";
          padding = lit "6px 0px 0px";
          margin = lit "10px 0px 0px 20px";
          columns = lit "2";
          lines = lit "5";
          background-color = lit "@bg-col";
        };
        "element" = {
          padding = lit "5px";
          background-color = lit "@bg-col";
          text-color = lit "@fg-col";
        };
        "element-icon" = {
          size = lit "25px";
        };
        "element selected" = {
          background-color = lit "@selected-col";
          text-color = lit "@fg-col2";
        };
        "mode-switcher" = {
          spacing = lit "0";
        };
        "button" = {
          padding = lit "10px";
          background-color = lit "@bg-col-light";
          text-color = lit "@grey";
          vertical-align = lit "0.5";
          horizontal-align = lit "0.5";
        };
        "button selected" = {
          background-color = lit "@bg-col";
          text-color = lit "@accent";
        };
      };
  };
}
