{ config, pkgs, ... }:

{
  programs.home-manager.enable = true;
  home.username = "cgunn";
  home.homeDirectory = "/home/cgunn";

  imports = [
    ./pkgs
    ./neofetch
    ./kitty
    ./shell
    ./xserver
  ];

  home.packages = with pkgs; [
    nitrogen
    brightnessctl
    openvpn
    
    firefox
    chromium
    libreoffice
    spotify
    vscode
    discord
    slack
    bluejeans-gui
    teams
    mgba
    gimp
    qbittorrent
    calibre
    
    unar
    zathura
    ripgrep
    du-dust
    htop
    maim
    mupdf
    ( python3.withPackages ( ps: with ps; [ ipython black pip ] ))
    poetry
    gnumake
    docker
    fira-code
    gcc
    ffmpeg-full
    
    autojump
    bat
  ];

  xdg.userDirs = {
    enable      = true;
    desktop     = "\$HOME/.desktop";
    documents   = "\$HOME/docs";
    download    = "\$HOME/downloads";
    music       = "\$HOME/audio/music";
    pictures    = "\$HOME/images/pictures";
    videos      = "\$HOME/video";
    publicShare = "\$HOME/.useless";
    templates   = "\$HOME/.useless";
  };

  home.stateVersion = "21.03";
}
