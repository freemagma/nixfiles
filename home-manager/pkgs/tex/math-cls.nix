{pkgs, ...}:

pkgs.stdenv.mkDerivation rec {
  name = "math-cls";
  dontUnpack = true;
  installPhase = ''
    mkdir -p $out/tex/latex
    cp ${./math.cls} $out/tex/latex/math.cls
  '';
  pname = name;
  tlType = "run";
}