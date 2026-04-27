{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "platkaizohex";

  src = fetchurl {
    url = "https://github.com/zuils/PlatKaizoHeX/releases/download/2.0/PlatKaizoHeX-V2.0.zip";
    sha256 = "sha256-Lrfuy8fVrIg6p4cuklMe0lcyNiIFL9fFIIlZA2Wbgt0=";
  };

  nativeBuildInputs = [
    unzip
  ];

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    echo "${mono}/bin/mono $out/opt/PlatKaizoHeX/PlatKaizoHeX.exe" > platkaizohex.sh

    install -Dm755 -- platkaizohex.sh "$out/bin/platkaizohex"
    install -Dm755 -- PlatKaizoHeX.exe "$out/opt/PlatKaizoHeX/PlatKaizoHeX.exe"
  '';
}

