{ pkgs, custom, ... }:

{
  home.packages = with pkgs; [
    # System Control
    nitrogen
    brightnessctl
    openvpn
    openconnect
    pavucontrol

    # Apps
    firefox
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
    teams
    zoom-us
    signal-desktop
    desmume
    vlc
    custom.pkgs.crossfire

    # Minecraft
    minecraft
    polymc

    # CLI Tools
    unar
    zathura
    ripgrep
    du-dust
    htop
    maim
    mupdf
    # ffmpeg-full
    yt-dlp
    croc

    # Development
    (python3.withPackages (ps:
      with ps; [
        ipython
        black
        isort
      ]))
    jupyter
    poetry
    gnumake
    docker
    custom.pkgs.mytex

    # pokemon
    custom.pkgs.pkhex
    custom.pkgs.ekhex
    custom.pkgs.porymap
    custom.pkgs.pokemon-colorscripts
  ];
}
