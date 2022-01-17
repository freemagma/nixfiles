{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # general
    gcc
    efm-langserver

    # lua
    sumneko-lua-language-server
    luaformatter

    # python
    nodePackages.pyright
  ];


  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # general
      which-key-nvim
      nvim-treesitter
      vim-surround

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
