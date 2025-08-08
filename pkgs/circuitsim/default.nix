{ pkgs, ... }:
with pkgs;

let
  pname = "CircuitSim";
  version = "1.8.2-2110";
  schemaPath = "${gtk3}/share/gsettings-schemas/gtk+3-${gtk3.version}";
in stdenv.mkDerivation (rec {
  inherit pname version;

  buildInputs = [ makeWrapper ];

  unpackPhase = "true";
  buildPhase = "true";

  installPhase = ''
    mkdir -p "$out/bin" "$out/share/java"
    cp ${./csim.jar} "$out/share/java/CircuitSim.jar"
    makeWrapper \
      "${openjdk11}/bin/java" \
      "$out/bin/${pname}" \
      --prefix XDG_DATA_DIRS : "${schemaPath}" \
      --add-flags "-jar $out/share/java/CircuitSim.jar" '';
})
