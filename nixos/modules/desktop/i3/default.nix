{ self, ... }:
{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

    displayManager.defaultSession = "xfce+i3";
    displayManager.lightdm = {
      enable = true;
      background = "${self}/wallpapers/ghostly_gate_2560x1440.jpg";
      greeters.gtk.theme = {
        package = pkgs.gruvbox-dark-gtk;
        name = "gruvbox-dark";
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
      package = pkgs.i3-gaps;
    };
  };
}
