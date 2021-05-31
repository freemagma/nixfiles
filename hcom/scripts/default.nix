{ pkgs, ... }: {
  home.packages = with pkgs; [
    (pkgs.callPackage ./scanbatch.nix { })
    (pkgs.callPackage ./mktexdir.nix { })
    (pkgs.callPackage ./resetwifi.nix { })
    (pkgs.callPackage ./resetblue.nix { })
    (pkgs.callPackage ./em.nix { })
  ];
}
