{---------------------------------------------------------------}
{--  Imports                                                  --}
{---------------------------------------------------------------}

import Data.Maybe
import Data.List
import Control.Monad
import System.Exit

import XMonad
import XMonad.Actions.CycleWindows
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.NoBorders
import XMonad.Layout.Fullscreen (fullscreenFull)
import XMonad.Layout.Spacing
import XMonad.Prompt
import XMonad.Prompt.Shell (shellPrompt)
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Util.EZConfig

import qualified XMonad.Actions.Search as S
import qualified XMonad.StackSet as W

{---------------------------------------------------------------}
{--  Simple Variables                                         --}
{---------------------------------------------------------------}

myTerminal = "kitty"

myModMask = mod4Mask -- Windows Key
laltMask = mod1Mask

myLayout = noBorders $ tall ||| full
  where tall = renamed [Replace "tall"] $ spacing $ Tall 1 (3/100) (1/2)
        full = renamed [Replace "full"] $ spacing $ fullscreenFull Full
        spacing = spacingRaw False
          (Border 4 4 4 4) True
          (Border 4 4 4 4) True

nixOsChannel = "nixos-20.03"

{---------------------------------------------------------------}
{--  Prompt Settings                                          --}
{---------------------------------------------------------------}

myXPConfig :: XPConfig
myXPConfig = def { 
    font                = "xft:Fira Code:size=11:bold:antialias=true"
  , bgColor             = "#2e2a31"
  , fgColor             = "#bcbabe"
  , bgHLight            = "#d8d7da"
  , fgHLight            = "#000000"
  , borderColor         = "#2e2a31"
  , promptBorderWidth   = 0
  , position            = Top
  , height              = 23
  , alwaysHighlight     = True
  , maxComplRows        = Nothing
  }

myXPConfig' :: XPConfig
myXPConfig' = myXPConfig { 
    historySize   = 0
  }

-- Search Engine Prompt
archWiki      = S.searchEngine "archwiki"       "https://wiki.archlinux.org/index.php?search="
stackOverflow = S.searchEngine "stack overflow" "https://stackoverflow.com/search?q="
reddit        = S.searchEngine "reddit"         "https://www.reddit.com/search/?q="
nixOsPkgs     = S.searchEngine "nix pkgs"       ("https://nixos.org/nixos/packages.html?channel=" ++ nixOsChannel ++ "&query=")
nixOsOptions  = S.searchEngine "nix options"    "https://nixos.org/nixos/options.html#"
nixOsWiki     = S.searchEngine "nix wiki"       "https://nixos.wiki/index.php?search="
thesaurus     = S.searchEngine "thesaurus"      "https://www.thesaurus.com/browse/"
etymonline    = S.searchEngine "etymonline"     "https://www.etymonline.com/search?q="

searchList :: [(String, S.SearchEngine)]
searchList = [ 
    ("a", archWiki)
  , ("d", S.duckduckgo)
  , ("e", etymonline)
  , ("g", S.google)
  , ("h", S.hoogle)
  , ("m", S.alpha)
  , ("n", nixOsWiki)
  , ("o", nixOsOptions)
  , ("p", nixOsPkgs)
  , ("r", reddit)
  , ("s", stackOverflow)
  , ("t", thesaurus)
  , ("v", S.dictionary)
  , ("w", S.wikipedia)
  , ("y", S.youtube)
  , ("z", S.amazon)
  ]

{---------------------------------------------------------------}
{--  Keybingings                                              --}
{---------------------------------------------------------------}

myKeys :: [(String, X ())]
myKeys = [
  -- Recompiling, Restarting, and Shutting Down
    ("M-r",           spawn "xmonad --recompile && xmonad --restart")
  , ("M-S-r",         spawn "shutdown -r now")
  , ("M-<Escape>",    io (exitWith ExitSuccess))
  , ("M-S-<Escape>",  spawn "shutdown now")

  -- Windows
  , ("M-S-m",         windows W.swapMaster)
  , ("M1-<Tab>",      windows W.focusDown)

  -- Volume and Brightness
  , ("M-<Down>",      spawn "amixer set Master toggle")
  , ("M-<Left>",      spawn "amixer set Master 5%- unmute")
  , ("M-<Right>",     spawn "amixer set Master 5%+ unmute")
  , ("M-S-<Down>",    spawn "brightnessctl set 50%")
  , ("M-S-<Left>",    spawn "brightnessctl set 10%-")
  , ("M-S-<Right>",   spawn "brightnessctl set 10%+")
  
  -- Spawning Programs
  , ("M-f",           spawn "firefox")
  , ("M-<Return>",    spawn myTerminal)

  -- Open Configs
  , ("M-c",           spawn "code /home/cgunn/dev/dotfiles")

  -- Prompts
  , ("M-q",           shellPrompt myXPConfig)

  -- Misc Tools
  , ("M-t m",         spawn "maim -s /home/cgunn/images/screenshots/$(date -Ins).png")

  -- Misc Scipts
  , ("M-s w",         spawn "sh /home/cgunn/dev/sh/resetwifi.sh")
  , ("M-s b",         spawn "sh /home/cgunn/dev/sh/bluetooth.sh B4:CE:40:C2:79:31")
  , ("M-s h",         spawn "sh /home/cgunn/dev/sh/bluetooth.sh 38:18:4C:10:0F:40")
  , ("M-s a f",       spawn "python /home/cgunn/dev/autokey-scripts/left_right.py")
  , ("M-s a e",       spawn "python /home/cgunn/dev/autokey-scripts/press_a.py")
  ]
  ++ [("M-w "   ++ k, S.promptSearch myXPConfig' f) | (k,f) <- searchList ]
  ++ [("M-S-w " ++ k, S.selectSearch             f) | (k,f) <- searchList ]

{---------------------------------------------------------------}
{--  Startup Hook                                             --}
{---------------------------------------------------------------}

addNETSupported :: Atom -> X ()
addNETSupported x   = withDisplay $ \dpy -> do
    r               <- asks theRoot
    a_NET_SUPPORTED <- getAtom "_NET_SUPPORTED"
    a               <- getAtom "ATOM"
    liftIO $ do
       sup <- (join . maybeToList) <$> getWindowProperty32 dpy a_NET_SUPPORTED r
       when (fromIntegral x `notElem` sup) $
         changeProperty32 dpy r a_NET_SUPPORTED a propModeAppend [fromIntegral x]

addEWMHFullscreen :: X ()
addEWMHFullscreen   = do
    wms <- getAtom "_NET_WM_STATE"
    wfs <- getAtom "_NET_WM_STATE_FULLSCREEN"
    mapM_ addNETSupported [wms, wfs]

myStartupHook = do
  screenConfig
  setWMName "LG3D"
  spawnOnce "picom --config /home/cgunn/dev/dotfiles/picom/picom.conf"
  spawnOnce "redshift -l 33.749:-84.38798"

screenConfig = do
  spawn "nitrogen --restore"

{---------------------------------------------------------------}
{--  Management Hooks                                         --}
{---------------------------------------------------------------}

myManageHook = composeAll [
    manageDocks
  , isFullscreen --> doFullFloat
  ]

{---------------------------------------------------------------}
{--  Status Bar                                               --}
{---------------------------------------------------------------}

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset

myBar n = "xmobar -x " ++ (show n) ++ " /home/cgunn/dev/dotfiles/home-manager/xmonad/xmobar.hs"
myPP = xmobarPP {
    ppCurrent = xmobarColor "#dc8a0e" "" . wrap "<" ">"
  , ppVisible = xmobarColor "#d8137f" ""
  , ppHidden = xmobarColor "#bb60ea" "" . wrap "*" ""
  , ppHiddenNoWindows = xmobarColor "#17ad98" ""
  , ppTitle = shorten 60
  , ppLayout = xmobarColor "#149bda" ""
  , ppSep =  "<fc=#4a464d> | </fc>"
  , ppUrgent = xmobarColor "#d8137f" "" . wrap "!" "!"
  , ppExtras  = [(fmap.fmap) (xmobarColor "#149bda" "" . wrap "(" ")") windowCount]
  , ppOrder  = \(ws:l:t:nw:_) -> [ws, l ++ " " ++ nw, t]
  }

toggleStrutsKey XConfig {XMonad.modMask = modMask} = 
  (modMask .|. shiftMask, xK_f)

{---------------------------------------------------------------}
{--  Main Method                                              --}
{---------------------------------------------------------------}

main = xmonad =<< statusBar (myBar 1) myPP toggleStrutsKey myConfig
  
myConfig = ewmh def {
    terminal        = myTerminal
  , modMask         = myModMask
  , layoutHook      = myLayout
  , startupHook     = myStartupHook >> addEWMHFullscreen
  , manageHook      = myManageHook
  , handleEventHook = fullscreenEventHook
  , borderWidth     = 0
  } `additionalKeysP` myKeys
