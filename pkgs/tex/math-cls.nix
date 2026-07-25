{ lib, stdenv }:

stdenv.mkDerivation {
  pname = "math-cls";
  version = "1.0";

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/tex/latex
    cp ${./math.cls} $out/tex/latex/math.cls

    runHook postInstall
  '';

  tlType = "run";

  meta = {
    description = "Personal LaTeX document class for problem sets";
    platforms = lib.platforms.all;
  };
}
