{ config, pkgs, ... }: {
  home.stateVersion = "21.05";
  programs.home-manager.enable = true;
  home.username = "cgunn";
  home.homeDirectory = "/home/cgunn";

  imports = [
    ./modules/pkgs
    ./modules/neofetch
    ./modules/kitty
    ./modules/shell
    ./modules/xserver
    ./modules/userdirs
    ./modules/scripts
    ./modules/doom-emacs
    ./modules/neovim
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
    gcc
  ];
}
