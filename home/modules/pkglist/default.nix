{ self, ... }:
{ pkgs, system, ... }:

let
  mypkgs = self.packages.${system};
in
{
  home.packages = with pkgs; [
    # system control
    nitrogen
    brightnessctl
    pavucontrol

    # apps
    firefox
    google-chrome
    libreoffice
    spotify
    discord
    slack
    gimp
    qbittorrent
    calibre
    blender
    inkscape
    zoom-us
    signal-desktop
    vlc
    mullvad-vpn
    mgba
    polymc
    mypkgs.crossfire

    # cmdline tools
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

    # dev
    (python3.withPackages (ps:
      with ps; [
        ipython
        black
        isort
      ]))
    poetry
    jupyter
    docker
    mypkgs.mytex

    # pokemon
    mypkgs.pkhex
    mypkgs.ekhex
    mypkgs.porymap
  ];
}