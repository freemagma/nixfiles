{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      include ${./kitty.conf}
    '';
  };
}
