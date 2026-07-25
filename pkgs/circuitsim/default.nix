{ lib, stdenv, makeWrapper, gtk3, openjdk11 }:

let
  schemaPath = "${gtk3}/share/gsettings-schemas/gtk+3-${gtk3.version}";
in
stdenv.mkDerivation {
  pname = "CircuitSim";
  version = "1.8.2-2110";

  dontUnpack = true;
  dontBuild = true;

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    install -Dm644 -- ${./csim.jar} "$out/share/java/CircuitSim.jar"
    makeWrapper "${openjdk11}/bin/java" "$out/bin/CircuitSim" \
      --prefix XDG_DATA_DIRS : "${schemaPath}" \
      --add-flags "-jar $out/share/java/CircuitSim.jar"

    runHook postInstall
  '';

  meta = {
    description = "Circuit simulator used in Georgia Tech CS 2110";
    platforms = [ "x86_64-linux" ];
    mainProgram = "CircuitSim";
  };
}
