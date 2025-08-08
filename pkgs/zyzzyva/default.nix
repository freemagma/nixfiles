{ pkgs, ... }:
with pkgs;

let
  commonLibs = [
    libGL
    fontconfig
    freetype
    dbus
    libxkbcommon
    xorg.libX11
    xorg.libXext
    xorg.libxcb
    xorg.xcbutilwm
    xorg.xcbutilimage
    xorg.xcbutil
    xorg.xcbutilkeysyms
    xorg.xcbutilrenderutil
    xorg.libXcursor
  ];
in
stdenv.mkDerivation {
  name = "zyzzyva";

  src = fetchurl {
    url = "https://scrabbleplayers.org/zyzzyva/packages/342/NASPAZyzzyva342.zip";
    sha256 = "sha256-vHGq1YkoH5wdaEC1hkY1KkAf61oRPx+hEBrnxWiY2k4=";
  };

  nativeBuildInputs = [
    autoPatchelfHook
    makeWrapper
    unzip
  ];

  sourceRoot = ".";
  dontAutoPatchelf = true;

  installPhase =
    let
      libPath = lib.makeLibraryPath (commonLibs ++ [
        bzip2
        xz
        stdenv.cc.cc.lib
      ]);
    in
    ''
      runHook preInstall

      mkdir -p $out/bin $out/build $out/cache
      mv ./Install\ NASPA\ Zyzzyva\ 3.4.2 zyzzyva-installer

      patchelf \
        --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" \
        --set-rpath "${libPath}" zyzzyva-installer \
        zyzzyva-installer

      ./zyzzyva-installer in --root $out/build --al -c --cache-path $out/cache
      ln -s $out/build/bin/zyzzyva $out/bin/zyzzyva

      runHook postInstall
    '';

  preFixup =
    let
      libPath = lib.makeLibraryPath (commonLibs ++ [
        libz
        glib
        krb5
      ]);
    in
    ''
      patchelf --set-interpreter "$(cat $NIX_CC/nix-support/dynamic-linker)" $out/build/bin/zyzzyva

      for bin in "$out/build/bin/zyzzyva" "$out/build/bin/*.so*" "$out/build/bin/platforms/*.so*"; do
        patchelf --set-rpath "${libPath}:$out/build/bin" $bin
      done

      wrapProgram $out/bin/zyzzyva \
        --set LD_LIBRARY_PATH "${lib.makeLibraryPath [ openssl_1_1 ]}:$LD_LIBRARY_PATH"
    '';
}

