{ self, ... }:
{ pkgs, system, ... }:

{
  home.packages = [ pkgs.bat ];

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.fish = {
    enable = true;
    shellAbbrs = {
      la = "ls -lah";
      nixr = "nixos-rebuild switch --use-remote-sudo --flake ~/dev/nixfiles";
      # git
      gaa = "git add --all";
      gc = "git commit";
      gcm = "git commit -m";
      gdca = "git diff --cached";
      glg = "git log";
      gst = "git status";
      gl = "git pull";
      gp = "git push";
      gch = "git checkout";
    };
    shellAliases = {
      cat = "bat -p --paging=never";
      activate = "source .venv/bin/activate";
      ssh = "kitty +kitten ssh";
    };
    shellInit = ''
      set -g fish_greeting
    '';
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      git_status.deleted = "X";
    };
  };

  programs.autojump = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "Charles Gunn";
    userEmail = "me@cjgunn.com";
    extraConfig.init.defaultBranch = "main";
  };
}
