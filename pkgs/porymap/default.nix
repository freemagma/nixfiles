{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "porymap";

  src = fetchFromGitHub {
    owner = "huderlem";
    repo = "porymap";
    rev = "5.4.0";
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
}
