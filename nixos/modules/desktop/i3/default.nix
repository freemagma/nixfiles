{ self, ... }:
{ pkgs, ... }:

{
  services.displayManager.defaultSession = "xfce+i3";
  services.xserver = {
    enable = true;
    xkb.layout = "us";

    displayManager.lightdm = {
      enable = true;
      background = "${self}/wallpapers/ghostly_gate_2560x1440.jpg";
      greeters.gtk.theme = {
        package = pkgs.catppuccin-gtk;
        name = "catppuccin-gtk";
      };
    };

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
      package = pkgs.i3;
    };
  };
}
