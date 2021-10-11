{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "pkhex";

  phases = [ "installPhase" ];

  installPhase = ''
    echo "${mono}/bin/mono $out/opt/PKHeX/PKHeX.exe $@" > pkhex.sh

    install -Dm755 -- pkhex.sh "$out/bin/pkhex"
    install -Dm755 -- ${./PKHeX.exe} "$out/opt/PKHeX/PKHeX.exe"
  '';
}
