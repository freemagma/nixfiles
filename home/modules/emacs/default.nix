_: { pkgs, ... }:
with pkgs;

{
  home.packages = [ ];
  programs.emacs.enable = true;
  services.emacs.enable = true;
}

