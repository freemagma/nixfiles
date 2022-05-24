{ pkgs, ... }:
with pkgs; 

{
  home.file.".doom.d" = {
    source = ./doom;
    recursive = true;
  };

  home.packages = [
    # required dependencies
    git
    ripgrep
    fd
    # cc
    clang-tools
    irony-server
    # nix
    nixfmt
    # haskell
    cabal-install
    (haskellPackages.ghcWithPackages (hp: with hp; [ hoogle ]))
    # prettier
    nodePackages.prettier
    # cmake
    cmake-format
  ];

  programs.emacs.enable = true;
  services.emacs.enable = true;
}

