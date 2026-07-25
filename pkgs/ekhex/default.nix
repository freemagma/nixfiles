{ lib, stdenv, makeWrapper, mono }:

stdenv.mkDerivation {
  pname = "ekhex";
  version = "unstable-2023-02-11";

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

  meta = {
    description = "PKHeX fork for Pokemon Emerald Kaizo (vendored prebuilt binary)";
    platforms = [ "x86_64-linux" ];
    mainProgram = "ekhex";
  };
}
