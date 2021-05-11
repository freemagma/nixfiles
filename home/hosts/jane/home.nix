{ config, pkgs, ... }:
{
    home.stateVersion = "21.05";
    programs.home-manager.enable = true;
    home.username = "cgunn";
    home.homeDirectory = "/home/cgunn";

    imports = [
        ./modules/pkgs
        ./modules/neofetch
        ./modules/kitty
        ./modules/shell
        ./modules/xserver
        ./modules/userdirs
        ./modules/scripts
    ];

    home.packages = with pkgs; [
        # System Control
        nitrogen
        brightnessctl
        vulkan-tools
        openvpn
        openconnect
        
        # GUI Apps
        firefox
        chromium
        libreoffice
        spotify
        vscode
        discord
        slack
        mgba
        gimp
        qbittorrent
        calibre
        blender
        
        # CLI Tools
        unar
        zathura
        ripgrep
        du-dust
        htop
        maim
        mupdf
        steam-run

        # Development
        ( python3.withPackages ( ps: with ps; [ ipython black pip ] ))
        poetry
        gnumake
        docker
        gcc
    ];
}