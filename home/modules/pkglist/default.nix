{ self, suyu, ... }:
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
    gimp
    deluge
    calibre
    blender
    inkscape
    zoom-us
    mpv
    mullvad-vpn
    mgba
    prismlauncher
    cubiomes-viewer
    mypkgs.crossfire
    mypkgs.ingrid
    suyu.packages.${system}.suyu
    mypkgs.ekhex
    mypkgs.zyzzyva

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
    rclone
    xclip

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
      ]))
    conda
    docker
    elan
  ];
}
