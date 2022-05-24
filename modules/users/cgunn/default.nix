{
  base = {
    users.users.cgunn = {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" ];
    };
  };

  home = import ./home;
}
