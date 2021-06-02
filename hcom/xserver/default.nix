{ pkgs, ... }: {

  imports = [ ./polybar ./i3 ];

  # home.packages = with pkgs; [ haskellPackages.xmobar ];
  # xsession.windowManager.xmonad = {
  #   enable = true;
  #   enableContribAndExtras = true;
  #   extraPackages = hp: [ hp.xmobar ];
  #   config = ./xmonad/xmonad.hs;
  # };

  services.picom = {
    enable = true;
    backend = "xrender";
    inactiveDim = "0.25";
    opacityRule = [ "90:class_g = 'kitty'" ];
  };
}
