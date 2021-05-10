{ pkgs, ... }:
{
    home.packages = with pkgs; [
        spaceship-prompt
        fira-code
        autojump
        bat
    ];

    programs.zsh = {
        enable = true;
        shellAliases = {
            la = "ls -lah";
            nixr = "sudo nixos-rebuild switch";
            homr = "home-manager switch";
            cleo = "clear && neofetch";
            cat = "bat -p --paging=never";
            activate = "source .venv/bin/activate";
            ssh = "kitty +kitten ssh";
        };
        initExtra = ''
            source ${pkgs.spaceship-prompt}/share/zsh/themes/spaceship.zsh-theme
            
            SPACESHIP_DIR_TRUNC=5;
            SPACESHIP_CHAR_SYMBOL="$";
            SPACESHIP_CHAR_SUFFIX=" ";
            SPACESHIP_GIT_STATUS_DELETED="X";
            neofetch
        '';
    };

    programs.zsh.oh-my-zsh = {
        enable = true;
        plugins = [ 
            "git" 
            "autojump" 
            "colorize" 
            "colored-man-pages"
        ];
    };

    programs.neovim = {
        enable = true;
        viAlias = true;
        vimAlias = true;
        extraConfig = ''
        '';
        plugins = with pkgs.vimPlugins; [
            vim-airline
            vim-polyglot
            vim-fugitive
        ];
    };

    programs.git = {
        enable = true;
        userName = "Charles Gunn";
        userEmail = "cjgunnmail@gmail.com";
    };
}