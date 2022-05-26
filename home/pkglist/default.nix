{ self, ... }:
{ pkgs, system, ... }:

let
  mypkgs = self.packages.${system};
in
{
  home.packages = with pkgs; [
    # System Control
    nitrogen
    brightnessctl
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
    zoom-us
    signal-desktop
    desmume
    vlc
    mullvad-vpn
    mypkgs.crossfire

    # Minecraft
    polymc

    # CLI Tools
    unar
    zathura
    ripgrep
    du-dust
    htop
    maim
    mupdf
    ffmpeg-full
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
    mypkgs.mytex

    # pokemon
    mypkgs.pkhex
    mypkgs.ekhex
    mypkgs.porymap
    mypkgs.pokemon-colorscripts
  ];
}
