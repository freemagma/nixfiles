{ pkgs, custom, ... }:

{
  home.packages = with pkgs; [
    # System Control
    nitrogen
    brightnessctl
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
    inkscape
    bluejeans-gui
    teams
    zoom-us
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
    awscli2

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
    agda

    # pokemon
    custom.pkgs.pkhex
    custom.pkgs.ekhex
    custom.pkgs.porycript
    custom.pkgs.porymap
  ];
}
