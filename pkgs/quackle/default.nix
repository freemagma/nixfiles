{ lib, stdenv, fetchFromGitHub, qt5 }:

stdenv.mkDerivation rec {
  pname = "quackle";
  version = "1.0.4";

  src = fetchFromGitHub {
    owner = "quackle";
    repo = "quackle";
    rev = "v${version}";
    hash = "sha256-RitlZSBMYWIb+1clq6lF2RpWJqhSu8yp7LbdUbSI6KI=";
  };

  buildInputs = [ qt5.qtdeclarative ];

  nativeBuildInputs = [ qt5.wrapQtAppsHook ];
  hardeningDisable = [ "format" ];

  buildPhase = ''
    qmake quackle.pro && make
    cd quackleio && qmake && make && cd ..
    cd quacker
    qmake && make
  '';

  installPhase = ''
    install -Dm755 -- Quackle "$out/bin/quackle"
    mv ../data "$out/data"
  '';

  meta = {
    description = "Crossword game engine and analysis tool";
    homepage = "https://github.com/quackle/quackle";
    platforms = lib.platforms.linux;
    mainProgram = "quackle";
  };
}
