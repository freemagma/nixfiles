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
    qbittorrent
    deluge
    hexchat
    calibre
    blender
    inkscape
    zoom-us
    teams
    signal-desktop
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
    mypkgs.spim-keepstats

    # pokemon
    mypkgs.pkhex
    mypkgs.ekhex
    mypkgs.porymap
  ];
}
