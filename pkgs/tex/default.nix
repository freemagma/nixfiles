{ callPackage, texlive }:

let
  math-cls.pkgs = [ (callPackage ./math-cls.nix { }) ];
in
texlive.combine {
  inherit (texlive) scheme-full;
  inherit math-cls;
}
