{ pkgs, ... }:
with pkgs;

buildGoModule {
  name = "poryscript";

  src = fetchFromGitHub {
    owner = "huderlem";
    repo = "poryscript";
    rev = "2.12.0";
    sha256 = "gt8ykN0PpshFPQgcHpKflo65phjDyE3y6g9C6lBk548=";
  };

  vendorHash = "0sjjj9z1dhilhpc8pq4154czrb79z9cm044jvn75kxcjv6v5l2m5";
}
