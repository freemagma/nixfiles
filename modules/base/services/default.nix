{ pkgs, ... }:

{
  # udev
  services.udev.packages = [ pkgs.qmk-udev-rules ];

  # CUPS
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];

  # OpenSSH
  services.openssh.enable = true;

  # blueman
  services.blueman.enable = true;

  # Docker
  virtualisation.docker.enable = true;
}
