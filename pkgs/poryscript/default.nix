{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "poryscript";
  version = "3.3.0";

  src = fetchFromGitHub {
    owner = "huderlem";
    repo = "poryscript";
    rev = version;
    hash = "sha256-TSb4zvZv7mEFwVYhjARykrAZKqASoIt4mSdGT1caKJM=";
  };

  vendorHash = "sha256-6hCgv2/8UIRHw1kCe3nLkxF23zE/7t5RDwEjSzX3pBQ=";

  meta = {
    description = "High-level scripting language for the pokeemerald/pokefirered decompilations";
    homepage = "https://github.com/huderlem/poryscript";
    platforms = lib.platforms.unix;
    mainProgram = "poryscript";
  };
}
