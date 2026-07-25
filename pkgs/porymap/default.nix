{ lib, stdenv, fetchFromGitHub, qt6 }:

stdenv.mkDerivation rec {
  pname = "porymap";
  version = "5.4.0";

  src = fetchFromGitHub {
    owner = "huderlem";
    repo = "porymap";
    rev = version;
    hash = "sha256-6USCMqOHkoX71ZSsdWuVLpfvYL/VspLR2w3Fp912RrA=";
  };

  buildInputs = [ qt6.qtdeclarative ];

  nativeBuildInputs = [ qt6.wrapQtAppsHook ];
  hardeningDisable = [ "format" ];

  buildPhase = ''
    qmake
    make
  '';

  installPhase = ''
    install -Dm755 -- porymap "$out/bin/porymap"
  '';

  meta = {
    description = "Map editor for the pokeruby/pokeemerald/pokefirered decompilations";
    homepage = "https://github.com/huderlem/porymap";
    platforms = lib.platforms.linux;
    mainProgram = "porymap";
  };
}
