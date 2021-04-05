{pkgs, ...}:

pkgs.stdenv.mkDerivation rec {
  name = "math-cls";
  src = ./math.cls;
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/tex/latex
    cp math.cls $out/tex/latex
  '';
  pname = name;
  tlType = "run";
}