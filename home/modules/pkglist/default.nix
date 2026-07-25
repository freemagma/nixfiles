{ self, suyu, claude-code-nix, ... }:
{ pkgs, system, ... }:

let
  mypkgs = self.packages.${system};
in
{
  home.packages = with pkgs; [
    # system control
    # nitrogen/brightnessctl/pamixer/maim live in the i3 module, which binds them
    pavucontrol

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
    desmume
    mypkgs.crossfire
    mypkgs.ingrid
    # suyu.packages.${system}.suyu

    # cmdline tools
    unar
    zathura
    ripgrep
    dust
    htop
    mupdf
    ffmpeg-full
    yt-dlp
    lftp
    rclone
    xclip
    claude-code-nix.packages.${system}.claude-code

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
