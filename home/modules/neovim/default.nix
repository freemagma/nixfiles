{ self, ... }: { pkgs, system, ... }:

let
  mypkgs = self.packages.${system};
in
{
  home.packages = with pkgs; [
    # general
    gcc
    efm-langserver
    file

    # nix
    nixpkgs-fmt

    # lua
    lua-language-server
    luaformatter

    # tex
    texlab

    # python
    pyright

    # ocaml
    ocamlPackages.ocaml-lsp
    ocamlformat

    # zig 
    zls

    # java 
    java-language-server

    # javascript 
    nodePackages.vscode-langservers-extracted
    nodePackages.prettier
  ];

  xdg.configFile."nvim/lua/lib" = {
    source = ./lib;
    recursive = true;
  };

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withPython3 = true;

    plugins = with pkgs.vimPlugins; [
      # general
      which-key-nvim
      nvim-treesitter
      lightspeed-nvim
      vim-surround
      direnv-vim
      nvim-autopairs
      comment-nvim
      guess-indent-nvim

      # visual
      catppuccin-nvim
      lualine-nvim
      bufferline-nvim
      mypkgs.scope-nvim
      indent-blankline-nvim

      # navigation
      nvim-tree-lua
      nvim-web-devicons
      telescope-nvim
      telescope-fzf-native-nvim
      project-nvim

      # git
      vim-fugitive

      # LSP
      nvim-lspconfig
      lean-nvim

      # completion
      nvim-cmp
      cmp-nvim-lsp
      cmp-path
      cmp-buffer
      cmp-cmdline
      cmp-omni

      luasnip
      cmp_luasnip
    ];

    extraConfig =
      ''
        ${builtins.readFile ./base.vim}
        lua << EOF
          ${builtins.readFile ./base.lua}
          ${builtins.readFile ./visual.lua}
          ${builtins.readFile ./treesitter.lua}
          ${builtins.readFile ./completion.lua}
          ${builtins.readFile ./snips.lua}
          ${builtins.readFile ./lsp.lua}
          ${builtins.readFile ./navigation.lua}
          ${builtins.readFile ./localkeys.lua}
        EOF
      '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
