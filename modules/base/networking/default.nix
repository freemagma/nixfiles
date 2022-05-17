{
  networking = {
    networkmanager.enable = true;
    networkmanager.dns = "systemd-resolved";

    useDHCP = false;

    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
    ];
  };
}
