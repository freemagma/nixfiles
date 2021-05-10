{ pkgs, ... }:
{
    home.packages = with pkgs; [
        xmobar
    ];

    xsession = {
        enable = true;
        windowManager.xmonad = {
            enable = true;
            enableContribAndExtras = true;
            config = ./xmonad/xmonad.hs;
            extraPackages = hp: [
                hp.xmobar
            ];
        };
    };

    services.picom = {
        enable = true;
        inactiveDim = "0.25";
        opacityRule = [
            "90:class_g = 'kitty'"
        ];
    };
}
