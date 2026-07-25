{ pkgs, ... }:

{
  home.packages = with pkgs; [ scid-vs-pc stockfish ];
}
