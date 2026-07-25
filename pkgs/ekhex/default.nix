{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "ekhex";

  dontUnpack = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    install -Dm644 -- ${./EKHeX.exe} "$out/opt/EKHeX/EKHeX.exe"
    makeWrapper ${mono}/bin/mono "$out/bin/ekhex" \
      --add-flags "$out/opt/EKHeX/EKHeX.exe"

    runHook postInstall
  '';
}
