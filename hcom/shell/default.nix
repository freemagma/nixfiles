{ pkgs, ... }: {
  home.packages = with pkgs; [ fira-code autojump bat ];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
  programs.direnv.nix-direnv.enableFlakes = true;

  programs.nushell = {
    enable = true;
    settings = {
      key_timeout = 0;
      pivot_mode = "never";
      line_editor = { edit_mode = "vi"; };
      prompt = "echo $(${pkgs.starship}/bin/starship prompt)";
      startup = [ ];
    };
  };
}
