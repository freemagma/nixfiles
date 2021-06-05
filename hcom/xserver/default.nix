{ pkgs, ... }: {

  imports = [ ./polybar ./i3 ];

  services.picom = {
    enable = true;
    backend = "xrender";
    inactiveDim = "0.25";
    opacityRule = [ "90:class_g = 'kitty'" ];
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };
    theme = {
      name = "gruvbox-dark";
      package = pkgs.gruvbox-dark-gtk;
    };
  };
}
