{ pkgs, ... }:
with pkgs;

{
  home.packages = with pkgs; [
    (callPackage ./pkhex { })
    (callPackage ./poryscript { })
    (callPackage ./porymap { })
    (callPackage ./tex { })
    (callPackage ./ekhex { })
    (callPackage ./circuitsim { })
    (callPackage ./crossfire { })
  ];
}
