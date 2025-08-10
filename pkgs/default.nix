{ pkgs, ... }:

{
  pkhex = (pkgs.callPackage ./pkhex { });
  poryscript = (pkgs.callPackage ./poryscript { });
  porymap = (pkgs.callPackage ./porymap { });
  mytex = (pkgs.callPackage ./tex { });
  ekhex = (pkgs.callPackage ./ekhex { });
  circuitsim = (pkgs.callPackage ./circuitsim { });
  crossfire = (pkgs.callPackage ./crossfire { });
  pokemon-colorscripts = (pkgs.callPackage ./pokemon-colorscripts { });
  scope-nvim = (pkgs.callPackage ./scope-nvim { });
  spim-keepstats = (pkgs.callPackage ./spim-keepstats { });
  ingrid = (pkgs.callPackage ./ingrid { });
  quackle = (pkgs.callPackage ./quackle { });
  zyzzyva = (pkgs.callPackage ./zyzzyva { });
  xhaven-assistant = (pkgs.callPackage ./xhaven-assistant { });
}
