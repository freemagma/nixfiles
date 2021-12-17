{ pkgs, ... }:
with pkgs;

{
  imports = [ ./hardware-configuration.nix ];

  # Networking
  networking.useDHCP = false;
  networking.networkmanager.enable = true;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlan0.useDHCP = true;

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  # Scanner
  hardware.sane.enable = true;
  hardware.sane.dsseries.enable = true;

  # This can be removed when PulseAudio is at least version 14
  # https://wiki.archlinux.org/index.php/Lenovo_ThinkPad_X1_Carbon_(Gen_7)#Audio
  hardware.pulseaudio.extraConfig = ''
    load-module module-alsa-sink   device=hw:0,0 channels=4
    load-module module-alsa-source device=hw:0,6 channels=4
  '';

  # This can be removed when the default kernel is at least version 5.6
  # https://github.com/NixOS/nixpkgs/pull/86168
  boot.kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "5.6")
    (lib.mkDefault pkgs.linuxPackages_latest);
}
