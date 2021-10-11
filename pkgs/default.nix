{ pkgs, ... }:
with pkgs;

{
  pkhex = (callPackage ./pkhex { });
  porycript = (callPackage ./poryscript { });
  porymap = (callPackage ./porymap { });
  mytex = (callPackage ./tex { });
  ekhex = (callPackage ./ekhex { });
  circuitsim = (callPackage ./circuitsim { });
  crossfire = (callPackage ./crossfire { });
}