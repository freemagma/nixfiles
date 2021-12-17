{ pkgs, ... }:

{
  # udev
  services.udev.packages = [ pkgs.qmk-udev-rules ];

  # Unfree
  nixpkgs.config.allowUnfree = true;

  # CUPS
  services.printing.enable = true;

  # OpenSSH
  services.openssh.enable = true;

  # RatBag
  services.ratbagd.enable = true;

  # blueman
  services.blueman.enable = true;
}
