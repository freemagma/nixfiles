{
  networking.hostName = "orchid";
  networking.interfaces = {
    enp0s31f6.useDHCP = true;
    wlan0.useDHCP = true;
  };

  # This can be removed when PulseAudio is at least version 14
  # https://wiki.archlinux.org/index.php/Lenovo_ThinkPad_X1_Carbon_(Gen_7)#Audio
  hardware.pulseaudio.extraConfig = ''
    load-module module-alsa-sink   device=hw:0,0 channels=4
    load-module module-alsa-source device=hw:0,6 channels=4
  '';

  # for qbittorrent
  networking.firewall.allowedTCPPorts = [ 58276 ];

  system.stateVersion = "22.05";
}
