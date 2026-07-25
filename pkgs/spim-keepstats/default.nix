{ pkgs, ... }:
with pkgs;

stdenv.mkDerivation {
  name = "spim-keepstats";

  src = fetchFromGitHub {
    owner = "portersrc";
    repo = "spim-keepstats";
    rev = "9d7acf26b4fb473df839b2fce9b737351a16f77d";
    sha256 = "sha256-BjaNcT1sEke66VTfL6+9t4PHw6FtNpRzVyuFbdbZzlc=";
  };


  nativeBuildInputs = [ flex bison makeWrapper ];

  buildPhase = ''
    cd spim
    make spim
  '';

  installPhase = ''
    install -D -m 755 -- spim "$out/opt/spim/spim"
    install -D -m 0444 -- ../CPU/exceptions.s "$out/share/spim/exceptions.s"

    makeWrapper "$out/opt/spim/spim" "$out/bin/spim" \
      --set SPIM_EXCEPTION_HANDLER "$out/share/spim/exceptions.s"
  '';
}
