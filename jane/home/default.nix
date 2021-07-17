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
      machine.wireless_interface = "wlp4s0";
      machine.hasBattery = false;
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
      # System Control
      nitrogen
      brightnessctl
      vulkan-tools
      openvpn
      openconnect

      # GUI Apps
      firefox
      chromium
      google-chrome
      libreoffice
      spotify
      vscode
      discord
      slack
      mgba
      gimp
      qbittorrent
      calibre
      blender
      desmume
      zoom-us

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
    ];
  };
}
