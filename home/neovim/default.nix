_: { pkgs, ... }:

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

  home.file.".config/nvim/lua/lib" = {
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

      # visual
      gruvbox
      lualine-nvim
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
