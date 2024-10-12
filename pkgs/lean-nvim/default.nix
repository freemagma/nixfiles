{ pkgs, lib, ... }:

pkgs.vimUtils.buildVimPlugin {
  pname = "lean.nvim";
  version = "v1.0.0";
  src = pkgs.fetchFromGitHub {
    owner = "Julian";
    repo = "lean.nvim";
    rev = "7d8c68e509d6ff385992ae8c1788885a1cfa7769";
    sha256 = "sha256-j4905VcKYL1AHW8k1V2lUUxJxwFx8oK7bP+Uz0z+NEA=";
  };
}
