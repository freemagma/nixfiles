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
    pamixer

    # apps
    firefox
    google-chrome
    libreoffice
    spotify
    discord
    slack
    gimp
    deluge
    hexchat
    calibre
    blender
    inkscape
    zoom-us
    vlc
    mullvad-vpn
    mgba
    prismlauncher
    cubiomes-viewer
    gtkwave
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
    lftp

    # ios
    libimobiledevice
    ifuse

    # controllers
    joycond

    # dev
    (python3.withPackages (ps:
      with ps; [
        ipython
        black
        isort
        pygments # for latex code formatting
      ]))
    conda
    docker
    mypkgs.mytex

    # pokemon
    mypkgs.pkhex
    mypkgs.ekhex
    mypkgs.porymap
  ];
}
