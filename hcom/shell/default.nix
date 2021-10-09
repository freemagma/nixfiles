{ pkgs, ... }: {
  home.packages = with pkgs; [ spaceship-prompt fira-code bat ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    nix-direnv.enableFlakes = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      la = "ls -lah";
      nixr = "sudo nixos-rebuild switch";
      cleo = "clear && neofetch";
      cat = "bat -p --paging=never";
      activate = "source .venv/bin/activate";
      ssh = "kitty +kitten ssh";
    };
    initExtra = ''
      source ${pkgs.spaceship-prompt}/share/zsh/themes/spaceship.zsh-theme

      SPACESHIP_DIR_TRUNC=5;
      SPACESHIP_CHAR_SYMBOL="$";
      SPACESHIP_CHAR_SUFFIX=" ";
      SPACESHIP_GIT_STATUS_DELETED="X";
      neofetch
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "colorize" "colored-man-pages" ];
    };
  };

  programs.autojump = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Charles Gunn";
    userEmail = "me@cjgunn.com";
  };

}
