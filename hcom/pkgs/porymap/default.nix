{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "porymap";

  src = fetchFromGitHub {
    owner = "huderlem";
    repo = "porymap";
    rev = "4.4.0";
    sha256 = "01mwjjsrgi8q7ppx7ynkhs1snd4nj1gpdim7nbb5gy8h4fhdamym";
  };

  buildInputs = [ qt5.qtbase libGL ];

  nativeBuildInputs = [ qt5.wrapQtAppsHook ];

  buildPhase = ''
    qmake
    make
  '';

  installPhase = ''
    install -Dm755 -- porymap "$out/bin/porymap"
  '';
}
