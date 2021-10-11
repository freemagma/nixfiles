{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "ekhex";

  #src = fetchurl {
  #  url =
  #    "https://cdn.discordapp.com/attachments/773693725607591937/831581911990272010/EKHeX.exe";
  #  sha256 = "1y6k3k44xfqk0a2k8qcz5m31r0g2hacmb1alcwb98ci82lyn6a7b";
  #};

  phases = [ "installPhase" ];

  installPhase = ''
    echo "${mono}/bin/mono $out/opt/EKHeX/EKHeX.exe $@" > ekhex.sh

    install -Dm755 -- ekhex.sh "$out/bin/ekhex"
    install -Dm755 -- ${./EKHeX.exe} "$out/opt/EKHeX/EKHeX.exe"
  '';
}
