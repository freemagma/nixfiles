{
  networking = {
    networkmanager.enable = true;
    wireless.enable = false;

    useDHCP = false;

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
}
