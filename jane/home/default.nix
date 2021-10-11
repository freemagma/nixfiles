{ config, pkgs, custom, ... }:

{

  users.users.cgunn = {
    isNormalUser = true;
    extraGroups =
      [ "wheel" "networkmanager" "docker" "scanner" "lp" "adbusers" ];
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.cgunn = {

    _module.args = { style = import ../../hcom/style; };
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
      ../../hcom/chess
    ];

    home.packages = with pkgs; [
      # System Control
      nitrogen
      brightnessctl
      vulkan-tools
      openvpn
      openconnect
      pavucontrol

      # GUI Apps
      firefox
      chromium
      google-chrome
      libreoffice
      spotify
      discord
      slack
      mgba
      gimp
      qbittorrent
      calibre
      blender
      melonDS
      inkscape
      bluejeans-gui
      teams
      custom.pkgs.circuitsim
      custom.pkgs.crossfire

      # Minecraft
      minecraft
      multimc

      # CLI Tools
      unar
      zathura
      ripgrep
      du-dust
      htop
      maim
      mupdf
      ffmpeg-full

      # Development
      (python3.withPackages (ps:
        with ps; [
          ipython
          pip
          # emacs features
          black
          isort
          pyflakes
        ]))
      poetry
      gnumake
      docker
      valgrind
      custom.pkgs.mytex

      # pokemon
      custom.pkgs.pkhex
      custom.pkgs.ekhex
      custom.pkgs.porycript
      custom.pkgs.porymap
    ];
  };
}
