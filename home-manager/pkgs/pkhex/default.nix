{pkgs, ...}: with pkgs;

stdenv.mkDerivation {
  name = "pkhex";

  src = fetchurl {
    url = "https://dominikbodi.de/downloads/PKHeX-21.01.31.tar.gz";
    sha256 = "52edde43ef77d3979ad43217b2695b764639097bc6c9707ad69111dc997c39e0";
  };

  unpackPhase = ''
    tar -xzf $src
  '';

  installPhase = ''
    echo "${mono}/bin/mono $out/opt/PKHeX/PKHeX.exe $@" > pkhex.sh

    install -Dm755 -- pkhex.sh "$out/bin/pkhex"
    install -Dm755 -- PKHeX.exe "$out/opt/PKHeX/PKHeX.exe"

    mkdir -p -- "$out/opt/PKHeX/bak"
    mkdir -p -- "$out/opt/PKHeX/pkmdb"
    chmod 777 -- "$out/opt/PKHeX/bak"
    chmod 777 -- "$out/opt/PKHeX/pkmdb"
  '';
}