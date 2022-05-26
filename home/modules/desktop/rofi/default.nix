_: { config, style, ... }:

{
  programs.rofi = {
    enable = true;
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      with style.color; {
        #****************************************************************************
        # ROFI Color theme = Glue Pro Blue
        # Copyright = Rasmus Steinke
        # Modified By = Charlie Gunn
        #****************************************************************************
        "*" = {
          selected-normal-foreground = mkLiteral dark_bg;
          foreground = mkLiteral fg;
          normal-foreground = mkLiteral "@foreground";
          alternate-normal-background = mkLiteral "transparent";
          red = mkLiteral bright_red;
          selected-urgent-foreground = mkLiteral yellow;
          blue = mkLiteral bright_cyan;
          urgent-foreground = mkLiteral orange;
          alternate-urgent-background = mkLiteral "transparent";
          active-foreground = mkLiteral cyan;
          lightbg = mkLiteral white;
          selected-active-foreground = mkLiteral bright_blue;
          alternate-active-background = mkLiteral "transparent";
          background = mkLiteral "transparent";
          bordercolor = mkLiteral bg;
          alternate-normal-foreground = mkLiteral "@foreground";
          normal-background = mkLiteral "transparent";
          lightfg = mkLiteral dark_fg;
          selected-normal-background = mkLiteral blue;
          border-color = mkLiteral "@foreground";
          spacing = 2;
          separatorcolor = mkLiteral blue;
          urgent-background = mkLiteral "transparent";
          selected-urgent-background = mkLiteral blue;
          alternate-urgent-foreground = mkLiteral "@urgent-foreground";
          background-color = mkLiteral "#00000000";
          alternate-active-foreground = mkLiteral "@active-foreground";
          active-background = mkLiteral bg;
          selected-active-background = mkLiteral blue;
        };
        window = {
          background-color = mkLiteral "${bg}f2";
          border = 1;
          padding = 5;
        };
        mainbox = {
          border = 0;
          padding = 0;
        };
        message = {
          border = mkLiteral "1px dash 0px 0px";
          border-color = mkLiteral "@separatorcolor";
          padding = mkLiteral "1px";
        };
        textbox = { text-color = mkLiteral "@foreground"; };
        listview = {
          fixed-height = 0;
          border = mkLiteral "2px dash 0px 0px";
          border-color = mkLiteral "@separatorcolor";
          spacing = mkLiteral "2px";
          scrollbar = true;
          padding = mkLiteral "2px 0px 0px";
        };
        element = {
          border = 0;
          padding = mkLiteral "1px";
        };
        "element.normal.normal" = {
          background-color = mkLiteral "@normal-background";
          text-color = mkLiteral "@normal-foreground";
        };
        "element.normal.urgent" = {
          background-color = mkLiteral "@urgent-background";
          text-color = mkLiteral "@urgent-foreground";
        };
        "element.normal.active" = {
          background-color = mkLiteral "@active-background";
          text-color = mkLiteral "@active-foreground";
        };
        "element.selected.normal" = {
          background-color = mkLiteral "@selected-normal-background";
          text-color = mkLiteral "@selected-normal-foreground";
        };
        "element.selected.urgent" = {
          background-color = mkLiteral "@selected-urgent-background";
          text-color = mkLiteral "@selected-urgent-foreground";
        };
        "element.selected.active" = {
          background-color = mkLiteral "@selected-active-background";
          text-color = mkLiteral "@selected-active-foreground";
        };
        "element.alternate.normal" = {
          background-color = mkLiteral "@alternate-normal-background";
          text-color = mkLiteral "@alternate-normal-foreground";
        };
        "element.alternate.urgent" = {
          background-color = mkLiteral "@alternate-urgent-background";
          text-color = mkLiteral "@alternate-urgent-foreground";
        };
        "element.alternate.active" = {
          background-color = mkLiteral "@alternate-active-background";
          text-color = mkLiteral "@alternate-active-foreground";
        };
        scrollbar = {
          width = mkLiteral "4px";
          border = 0;
          handle-width = mkLiteral "8px";
          padding = 0;
        };
        mode-switcher = {
          border = mkLiteral "2px dash 0px 0px";
          border-color = mkLiteral "@separatorcolor";
        };
        "button.selected" = {
          background-color = mkLiteral "@selected-normal-background";
          text-color = mkLiteral "@selected-normal-foreground";
        };
        button = {
          background-color = mkLiteral "@background";
          text-color = mkLiteral "@foreground";
        };
        inputbar = {
          spacing = 0;
          text-color = mkLiteral "@normal-foreground";
          padding = mkLiteral "1px";
        };
        case-indicator = {
          spacing = 0;
          text-color = mkLiteral "@normal-foreground";
        };
        entry = {
          spacing = 0;
          text-color = mkLiteral "@normal-foreground";
        };
        prompt = {
          spacing = 0;
          text-color = mkLiteral "@normal-foreground";
        };
        inputbar = {
          children = map mkLiteral [
            "prompt"
            "textbox-prompt-colon"
            "entry"
            "case-indicator"
          ];
        };
        textbox-prompt-colon = {
          expand = false;
          str = ":";
          margin = mkLiteral "0px 0.3em 0em 0em";
          text-color = mkLiteral "@normal-foreground";
        };
      };
  };
}
