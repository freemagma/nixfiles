_:

{
  conda = {
    nixpkgs.overlays = [
      (final: prev: {
        conda = prev.conda.override { extraPkgs = [ prev.glib prev.xorg.libXext ]; };
      })
    ];
  };
}
    
