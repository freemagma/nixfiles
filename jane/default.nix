{ config, pkgs, ... }:

{
  imports = [
    ../com/xserver
    ../com/options
    ./boot
    ./hardware
    ./services
    ./programs
    ./home
  ];

  networking.hostName = "jane";
  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
    vim
    wget
    firefox
    networkmanager
    git
  ];

  system.stateVersion = "21.05";
}
