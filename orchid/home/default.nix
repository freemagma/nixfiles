{ config, pkgs, ... }:

{
  imports = [ <home-manager/nixos> ];

  users.users.cgunn = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.users.cgunn = { pkgs, ... }: {

    _module.args = {
      style = import ../../hcom/style;
      machine.wireless_interface = "wlan0";
      machine.hasBattery = true;
    };
    imports = [
      ../../hcom/pkgs
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
      vscode
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
    ];
  };
}
