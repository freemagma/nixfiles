{ config, pkgs, ... }:

{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "cgunn";
  home.homeDirectory = "/home/cgunn";

  home.packages = with pkgs; [
    picom
    nitrogen
    brightnessctl
    
    firefox
    libreoffice
    spotify
    vscode
    discord
    slack
    bluejeans-gui
    teams
    mgba
    gimp
    
    kitty
    unar
    zathura
    neofetch
    ripgrep
    du-dust
    htop
    maim
    mupdf
    xdg-user-dirs
    xmobar
    ( python3.withPackages ( ps: with ps; [ ipython black pip ] ))
    poetry
    gnumake
    docker
    fira-code
    gcc
    
    zsh
    oh-my-zsh
    spaceship-prompt
    autojump
    bat
    
    (import ./tex { inherit pkgs; })
    (import ./pkgs/pkhex { inherit pkgs; })
  ];

  programs.zsh = {
    enable = true;
    shellAliases = {
      la = "ls -lah";
      nixr = "sudo nixos-rebuild switch";
      homr = "home-manager switch";
      cleo = "clear && neofetch";
      cat="bat -p --paging=never";
      activate="source .venv/bin/activate";
      ssh="kitty +kitten ssh";
    };
    initExtra = ''
      source ${pkgs.spaceship-prompt}/share/zsh/themes/spaceship.zsh-theme
     
      SPACESHIP_DIR_TRUNC=5;
      SPACESHIP_CHAR_SYMBOL="$";
      SPACESHIP_CHAR_SUFFIX=" ";
      SPACESHIP_GIT_STATUS_DELETED="X";
      neofetch
    '';
  };

  programs.zsh.oh-my-zsh = {
    enable = true;
    plugins = [ 
      "git" 
      "autojump" 
      "colorize" 
      "colored-man-pages"
    ];
  };

  programs.kitty = {
    enable = true;
    extraConfig = ''
      include /home/cgunn/dev/dotfiles/home-manager/kitty/kitty.conf
    '';
  };

  programs.git = {
    enable = true;
    userName = "Charles Gunn";
    userEmail = "cjgunnmail@gmail.com";
  };

  services.picom = {
    enable = true;
    inactiveDim = "0.25";
    opacityRule = [
      "90:class_g = 'kitty'"
    ];
  };

  xdg.configFile = {
    "neofetch/config.conf".source = ./neofetch/config.conf;
    "neofetch/logo.ascii".source = ./neofetch/nixos.ascii;
  };

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

  xsession = {
    enable = true;
    windowManager.xmonad = {
      enable = true;
      enableContribAndExtras = true;
      config = ./xmonad/xmonad.hs;
      extraPackages = haskellPackages: [
        haskellPackages.xmobar
      ];
    };
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.03";
}
