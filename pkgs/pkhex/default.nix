{ lib, stdenv, makeWrapper, mono }:

stdenv.mkDerivation {
  pname = "pkhex";
  version = "unstable-2022-08-14";

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

  meta = {
    description = "Pokemon save editor (vendored prebuilt binary)";
    homepage = "https://github.com/kwsch/PKHeX";
    platforms = [ "x86_64-linux" ];
    mainProgram = "pkhex";
  };
}
