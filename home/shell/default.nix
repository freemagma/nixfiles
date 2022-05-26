{ self, ... }:
{ pkgs, system, ... }:

{
  home.packages = with pkgs; [ spaceship-prompt bat ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      la = "ls -lah";
      nixr = "sudo nixos-rebuild switch --flake ~/dev/nixfiles";
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
      SPACESHIP_BATTERY_SHOW=false;
      SPACESHIP_VI_MODE_SHOW=false;

      ${self.packages.${system}.pokemon-colorscripts}/bin/pokemon-colorscripts -r
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "colorize" "colored-man-pages" "vi-mode" ];
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
    extraConfig.init.defaultBranch = "main";
  };

}
