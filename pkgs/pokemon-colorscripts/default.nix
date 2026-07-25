{ lib, stdenv, fetchFromGitLab }:

stdenv.mkDerivation {
  pname = "pokemon-colorscripts";
  version = "unstable-2022-05-08";

  src = fetchFromGitLab {
    owner = "phoneybadger";
    repo = "pokemon-colorscripts";
    rev = "05d69994413e9faee13720da040cae68d2821791";
    sha256 = "9rZwojTELZO6aUpd/U0oN9GWtnpnyKcNQJtbdgn8WG4=";
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/opt/pokemon-colorscripts
    cp -rf colorscripts $out/opt/pokemon-colorscripts/colorscripts
    install -Dm755 -- pokemon-colorscripts.sh $out/opt/pokemon-colorscripts/pokemon-colorscripts.sh
    install -Dm755 -- nameslist.txt $out/opt/pokemon-colorscripts/nameslist.txt

    mkdir -p $out/bin
    ln -s $out/opt/pokemon-colorscripts/pokemon-colorscripts.sh $out/bin/pokemon-colorscripts

    runHook postInstall
  '';

  meta = {
    description = "Print colored Pokemon sprites in the terminal";
    homepage = "https://gitlab.com/phoneybadger/pokemon-colorscripts";
    platforms = lib.platforms.unix;
    mainProgram = "pokemon-colorscripts";
  };
}
