{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # general
    gcc

    # python
    nodePackages.pyright
  ];


  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      # visual
      gruvbox
      lualine-nvim

      # general
      which-key-nvim
      nvim-treesitter

      # navigation
      telescope-nvim
      telescope-fzf-native-nvim

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
      ${builtins.readFile ./config.vim}

      lua << EOF
        ${builtins.readFile ./config.lua}
      EOF
    '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
