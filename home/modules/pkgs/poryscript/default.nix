{pkgs, ...}: with pkgs;

buildGoModule {
  name = "poryscript";

  src = fetchFromGitHub {
    owner = "huderlem";
    repo = "poryscript";
    rev = "2.10.0";
    sha256 = "1aj43vmaficgmmpbvpvdbi6299i6spnzv1fwc222f4fvgv85gv6c";
  };

  vendorSha256 = "0sjjj9z1dhilhpc8pq4154czrb79z9cm044jvn75kxcjv6v5l2m5";
}