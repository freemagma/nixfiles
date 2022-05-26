_: { pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

    displayManager.defaultSession = "xfce+i3";
    displayManager.lightdm.enable = true;

    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
        enableScreensaver = false;
      };
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };
}
