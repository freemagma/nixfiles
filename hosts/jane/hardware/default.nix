{ pkgs, ... }:
with pkgs;

{
  imports = [ ./hardware-configuration.nix ];

  # Networking
  networking = {
    networkmanager.enable = true;
    wireless.enable = false;

    useDHCP = false;
    interfaces = {
      enp5s0.useDHCP = true;
      enp6s0.useDHCP = true;
      wlp4s0.useDHCP = true;
    };

    firewall = {
      enable = true;
      allowedTCPPorts = [ ];
      allowedUDPPorts = [ ];
    };

    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  # Scanner
  hardware.sane.enable = true;
  hardware.sane.dsseries.enable = true;
}
