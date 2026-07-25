{ lib
, stdenv
, fetchurl
, autoPatchelfHook
, unzip
, gtk3
, libepoxy
, atkmm
, pango
, cairo
, gdk-pixbuf
, bzip2
, glib
}:

stdenv.mkDerivation rec {
  pname = "xhaven-assistant";
  version = "1.11.1";

  src = fetchurl {
    url = "https://github.com/Tarmslitaren/FrosthavenAssistant/releases/download/v${version}/x-haven.assistant.${version}.linux.zip";
    sha256 = "sha256-YHqfApYjYxje6WKgQPGCl54sPXVbPBzyJ5uI9d3ABWg=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    unzip
  ];

  buildInputs = [
    gtk3
    libepoxy
    atkmm
    pango
    cairo
    gdk-pixbuf
    bzip2
    glib
    stdenv.cc.cc.lib
  ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/root
    mv * $out/root
    chmod +x  $out/root/x_haven_assistant
    ln -s $out/root/x_haven_assistant $out/bin/xhaven-assistant

    runHook postInstall
  '';

  meta = {
    description = "Digital assistant for the Frosthaven/Gloomhaven board games";
    homepage = "https://github.com/Tarmslitaren/FrosthavenAssistant";
    platforms = [ "x86_64-linux" ];
    mainProgram = "xhaven-assistant";
  };
}
