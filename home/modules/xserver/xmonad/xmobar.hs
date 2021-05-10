Config { 
    font =         "xft:Fira Code:size=11:bold:antialias=true"
  , bgColor =      "#2e2a31"
  , fgColor =      "#bcbabe"
  , position =     Top

  , iconRoot = "/home/cgunn/.config/nixpkgs/xmonad/icons"

  -- layout
  , sepChar =  "%"
  , alignSep = "}{"
  , template = " %UnsafeStdinReader% }{ %battery% <fc=#4a464d>|</fc> %date% "

  -- general behavior
  , lowerOnStart =     True    -- send to bottom of window stack on start
  , hideOnStart =      False   -- start with window unmapped (hidden)
  , allDesktops =      True    -- show on all desktops
  , overrideRedirect = True    -- set the Override Redirect flag (Xlib)
  , persistent =       True    -- enable/disable hiding (True = disabled)
  , commands = [
      Run Battery [
          "--template" , "<leftipat> <acstatus>"
        , "--Low"      , "37"        -- units: %
        , "--High"     , "72"        -- units: %
        , "--low"      , "#a54242"
        , "--normal"   , "#de935f"
        , "--high"     , "#8c9440"
        , "--"
        , "--off-icon-pattern"	, "<icon=battery/off/battery_off_%%.xpm/>"
        , "--on-icon-pattern"	  , "<icon=battery/on/battery_on_%%.xpm/>"
        , "--idle-icon-pattern" , "<icon=battery/idle/battery_idle_%%.xpm/>"
        , "-o", "<left>%", "-i", "<left>%", "-O", "<left>%"
      ] 50
    -- (%F = y-m-d date, %a = day of week, %T = h:m:s time)
    , Run Date "%a %F <fc=#4a464d>|</fc> %T" "date" 10
    , Run UnsafeStdinReader
    ]
}