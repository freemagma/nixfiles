{ pkgs ? import <nixpkgs> { }, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "crossfire";

  src = fetchurl {
    url = "http://beekeeperlabs.com/download/CrossFire-1_3_1-linux.tgz";
    sha256 = "1yhhfa3zq8qxrpwllihfnh79lca8b1v6qyg9k1319qmqixm24i3m";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    mkdir -pv $out/share/java $out/bin
    cp -r * $out/share/java
    makeWrapper ${jre8}/bin/java $out/bin/crossfire \
      --add-flags "-jar $out/share/java/CrossFire.jar" \
      --set LD_LIBRARY_PATH "${lib.makeLibraryPath [ cups.out ]}"
  '';

}
