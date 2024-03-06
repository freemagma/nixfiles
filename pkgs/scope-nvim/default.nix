{ pkgs, ... }:

pkgs.vimUtils.buildVimPlugin {
  pname = "scope.nvim";
  version = "2022-09-25";
  src = pkgs.fetchFromGitHub {
    owner = "tiagovla";
    repo = "scope.nvim";
    rev = "2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875";
    sha256 = "sha256-BdX+C5KBHZcFgDG2fXvhMl2Gp/6ffJWEBvA/JvVWh4I=";
  };
}
