{ pkgs, ... }:

let math-cls.pkgs = [ (import ./math-cls.nix { inherit pkgs; }) ];
in (pkgs.texlive.combine {
  inherit (pkgs.texlive) scheme-full;
  inherit math-cls;
})
