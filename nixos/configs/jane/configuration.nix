{
  networking.hostName = "jane";
  networking.interfaces = {
    wlp4s0.useDHCP = true;
    enp5s0.useDHCP = true;
  };

  # for qbittorrent
  networking.firewall.allowedTCPPorts = [ 56349 ];

  system.stateVersion = "22.05";
}
