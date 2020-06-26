{ config, pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.layout = "us"; 
  services.xserver.libinput.enable = true;
 
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
    extraPackages = haskellPackages: [
      haskellPackages.xmonad-contrib
      haskellPackages.xmonad-extras
      haskellPackages.xmonad
      haskellPackages.xmobar
    ];
  };
}
