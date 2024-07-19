{ pkgs, ... }:
with pkgs;

buildGoModule {
  name = "poryscript";

  src = fetchFromGitHub {
    owner = "huderlem";
    repo = "poryscript";
    rev = "3.3.0";
    hash = "sha256-TSb4zvZv7mEFwVYhjARykrAZKqASoIt4mSdGT1caKJM=";
  };

  vendorHash = "sha256-6hCgv2/8UIRHw1kCe3nLkxF23zE/7t5RDwEjSzX3pBQ=";
}
