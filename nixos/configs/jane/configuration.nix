{
  networking.hostName = "jane";
  networking.interfaces = {
    wlp4s0.useDHCP = true;
    enp5s0.useDHCP = true;
  };

  system.stateVersion = "22.05";
}
