{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "ingrid";

  src = fetchurl {
    name = "ingrid.tar.gz";
    url = "https://releases.ingrid.cx/download/tar";
    sha256 = "sha256-J9rWzrF0yNm4xVuyjBx1bBTp1s36jZvNwSCI5BcKAR8=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    wrapGAppsHook3
    mesa
  ];

  buildInputs = [
    alsa-lib
    at-spi2-atk
    cairo
    expat
    gtk3
    libdrm
    libgcc
    libxkbcommon
    nspr
    nss
    pango
    vivaldi-ffmpeg-codecs
  ];

  runtimeDependencies = [
    systemd
    libglvnd
    vulkan-loader
    xorg.libxcb
    xorg.libXcomposite
    xorg.libXdamage
    xorg.libXfixes
    xorg.libXrandr
  ];

  installPhase = ''
    mkdir -p $out/bin $out/opt/ingrid
    cp -rf * $out/opt/ingrid
    install -Dm755 Ingrid $out/opt/ingrid/Ingrid
    ln -s $out/opt/ingrid/Ingrid $out/bin/ingrid
  '';
}
