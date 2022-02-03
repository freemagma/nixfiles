{ pkgs, ... }:


let
  python = pkgs.python39.override {
    packageOverrides = self: super: {
      jupyter-client = super.jupyter-client.overridePythonAttrs (old: rec {
        version = "6.1.12";
        src = super.fetchPypi {
          inherit version;
          pname = old.pname;
          sha256 = "xLyh0IRhhsqL6X9NL6bSuuiJzOSJKhZ/+humvR9z54I=";
        };
      });
    };
  };
  magma-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "magma-nvim";
    version = "2022-02-02";
    src = pkgs.fetchFromGitHub {
      owner = "dccsillag";
      repo = "magma-nvim";
      rev = "0102629ff197c7faedc47c0fc8c8841d8c66a8cb";
      sha256 = "AusXdjilCf/m3CpXBEXb4epapSk/ATyqj2EkvxX0KBo=";
    };
  };
in
{
  home.packages = with pkgs; [
    # general
    gcc
    efm-langserver

    # lua
    sumneko-lua-language-server
    luaformatter

    # nix
    rnix-lsp

    # tex
    texlab

    # python
    nodePackages.pyright
  ];


  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    withPython3 = true;
    extraPython3Packages = (ps: with python.pkgs; [
      pynvim
      jupyter-client
      ueberzug
      cairosvg
    ]);

    plugins = with pkgs.vimPlugins; [
      # general
      which-key-nvim
      nvim-treesitter
      lightspeed-nvim
      vim-surround
      direnv-vim

      # visual
      gruvbox
      lualine-nvim

      # navigation
      nvim-tree-lua
      nvim-web-devicons
      telescope-nvim
      telescope-fzf-native-nvim
      project-nvim

      # git
      vim-fugitive

      # jupyter
      magma-nvim

      # LSP
      nvim-lspconfig

      # completion
      nvim-cmp
      cmp-nvim-lsp
      cmp-path
      cmp-buffer
      cmp-cmdline
      cmp-treesitter

      luasnip
      cmp_luasnip
    ];

    extraConfig = ''
      colorscheme gruvbox
      ${builtins.readFile ./base.vim}

      lua << EOF
        ${builtins.readFile ./base.lua}
        ${builtins.readFile ./visual.lua}
        ${builtins.readFile ./treesitter.lua}
        ${builtins.readFile ./completion.lua}
        ${builtins.readFile ./lsp.lua}
        ${builtins.readFile ./navigation.lua}
      EOF
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
