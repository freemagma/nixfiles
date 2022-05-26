_:

let
  addPkg = path: { pkgs, ... }: {
    home.packages = [ (pkgs.callPackage path { }) ];
  };
in
rec {
  scanbatch = addPkg ./scanbatch.nix;
  mktexdir = addPkg ./mktexdir.nix;
  resetwifi = addPkg ./resetwifi.nix;
  resetblue = addPkg ./resetblue.nix;
  em = addPkg ./em.nix;
  gtvpn = addPkg ./gtvpn.nix;

  bundles.all = {
    imports = [
      scanbatch
      mktexdir
      resetwifi
      resetblue
      em
      gtvpn
    ];
  };
}
