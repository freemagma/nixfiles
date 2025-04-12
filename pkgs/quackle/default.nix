{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "quackle";

  src = fetchFromGitHub {
    owner = "quackle";
    repo = "quackle";
    rev = "v1.0.4";
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
}
