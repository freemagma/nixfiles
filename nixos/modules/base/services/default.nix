{ pkgs, ... }:

{
  # udev
  services.udev.packages = [ pkgs.qmk-udev-rules ];

  # CUPS
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];
  services.printing.cups-pdf.enable = true;

  # OpenSSH
  services.openssh.enable = true;

  # blueman
  services.blueman.enable = true;

  # Docker
  virtualisation.docker.enable = true;

  # mullvad
  services.mullvad-vpn.enable = true;

  # usbmuxd
  services.usbmuxd.enable = true;
}
