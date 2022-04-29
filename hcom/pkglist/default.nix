{ pkgs, custom, ... }:
let
  python = pkgs.python39.override {
    packageOverrides = self: super: {
      jupyter-client = super.jupyter-client.overridePythonAttrs (old: rec {
        version = "6.1.12";
        src = super.fetchPypi {
          inherit version;
          pname = old.pname;
          sha256 = "xLyh0IRhhsqL6X9NL6bSuuiJzOSJKhZ/+humvR9z54I=";
        };
      });
    };
  };
in
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
    ffmpeg-full
    yt-dlp

    # Development
    (python.withPackages (ps:
      with ps; [
        ipython
        black
        isort
      ]))
    jupyter
    poetry
    gnumake
    docker
    valgrind
    custom.pkgs.mytex
    agda

    # pokemon
    custom.pkgs.pkhex
    custom.pkgs.ekhex
    custom.pkgs.poryscript
    custom.pkgs.porymap
    custom.pkgs.pokemon-colorscripts
  ];
}
