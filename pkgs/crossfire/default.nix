{ lib, stdenv, fetchurl, makeWrapper, jdk17, cups }:

stdenv.mkDerivation {
  pname = "crossfire";
  version = "1.3.2";

  src = fetchurl {
    url = "http://beekeeperlabs.com/download/CrossFire-1_3_2-linux.tgz";
    sha256 = "sha256-6xBD7+w+QhOsgy/xJ2a+pPqVI7tHGb8fjnAvAl+Phwo=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -pv $out/share/java $out/bin
    cp -r * $out/share/java
    makeWrapper ${jdk17}/bin/java $out/bin/crossfire \
      --add-flags "-jar $out/share/java/CrossFire.jar" \
      --set LD_LIBRARY_PATH "${lib.makeLibraryPath [ cups.out ]}"
  '';

  meta = {
    description = "Crossword construction program";
    homepage = "http://beekeeperlabs.com";
    platforms = [ "x86_64-linux" ];
    mainProgram = "crossfire";
  };
}
