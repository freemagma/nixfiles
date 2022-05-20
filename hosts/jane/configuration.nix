{
  networking.hostName = "jane";
  networking.interfaces = {
    enp5s0.useDHCP = true;
    enp6s0.useDHCP = true;
    wlan0.useDHCP = true;
  };

  system.stateVersion = "21.05";
}
