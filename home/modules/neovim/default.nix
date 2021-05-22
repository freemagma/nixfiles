{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    extraConfig = "";
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-polyglot
      vim-fugitive
      nerdtree
    ];
  };
}
