{ config, pkgs, ... }:

{
  imports = [
    ./boot
    ./hardware
    ./services
    ./programs
    ./home
    ../com/xserver
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