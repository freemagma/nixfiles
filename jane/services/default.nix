{
    # Nvidia
    nixpkgs.config.allowUnfree = true;
    services.xserver.videoDrivers = [ "nvidia" ];

    # CUPS
    services.printing.enable = true;

    # OpenSSH
    services.openssh.enable = true;

    # RatBag
    services.ratbagd.enable = true;
}