{
  networking = {
    wireless.iwd.enable = true;
    enableIPv6 = false;
    networkmanager = {
      enable = true;
      wifi.backend = "iwd";
    };
    useDHCP = false;
  };
}
