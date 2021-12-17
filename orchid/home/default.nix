{ config, pkgs, custom, machine, ... }:

{
  users.users.cgunn = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.cgunn = {

    _module.args = {
      style = import ../../hcom/style;
      inherit custom machine;
    };
    imports = [
      ../../hcom/neofetch
      ../../hcom/kitty
      ../../hcom/shell
      ../../hcom/xserver
      ../../hcom/userdirs
      ../../hcom/scripts
      ../../hcom/doom-emacs
      ../../hcom/neovim
    ];

    home.packages = with pkgs; [
      nitrogen
      brightnessctl
      openvpn

      firefox
      google-chrome
      chromium
      libreoffice
      spotify
      discord
      slack
      teams
      bluejeans-gui
      zoom-us
      mgba
      gimp
      qbittorrent
      calibre
      ffmpeg-full
      custom.pkgs.crossfire
      custom.pkgs.circuitsim

      unar
      zathura
      ripgrep
      du-dust
      htop
      maim
      mupdf
      (python3.withPackages (ps: with ps; [ ipython black pip ]))
      poetry
      gnumake
      docker
      gcc
      custom.pkgs.mytex
    ];
  };
}
