_: { pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "xfce+i3";

    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
        enableScreensaver = false;
      };
    };

    # windowManager.xmonad.enable = true;
    # windowManager.xmonad.enableContribAndExtras = true;

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };
}
