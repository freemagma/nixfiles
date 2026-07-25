{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "pkhex";

  dontUnpack = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    install -Dm644 -- ${./PKHeX.exe} "$out/opt/PKHeX/PKHeX.exe"
    makeWrapper ${mono}/bin/mono "$out/bin/pkhex" \
      --add-flags "$out/opt/PKHeX/PKHeX.exe"

    runHook postInstall
  '';
}
