{
  networking.hostName = "orchid";
  networking.interfaces = {
    enp0s31f6.useDHCP = true;
    wlan0.useDHCP = true;
  };

  # for qbittorrent
  networking.firewall.allowedTCPPorts = [ 58276 ];

  system.stateVersion = "22.05";
}
