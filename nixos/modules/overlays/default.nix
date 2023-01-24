_:

{
  conda = {
    nixpkgs.overlays = [
      (final: prev: {
        conda = prev.conda.override { extraPkgs = [ prev.glib prev.xorg.libXext ]; };
      })
    ];
  };
  catppuccin-gtk-mocha-pink = {
    nixpkgs.overlays = [
      (final: prev: {
        catppuccin-gtk = prev.catppuccin-gtk.override { variant = "mocha"; accents = [ "pink" ]; };
      })
    ];
  };
  catppuccin-gtk-macchiato-pink = {
    nixpkgs.overlays = [
      (final: prev: {
        catppuccin-gtk = prev.catppuccin-gtk.override { variant = "macchiato"; accents = [ "pink" ]; };
      })
    ];
  };
}
    
