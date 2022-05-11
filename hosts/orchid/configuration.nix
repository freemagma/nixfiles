{ pkgs, ... }:

{

  imports = [
    ../../com/xserver
    ../../com/options
    ../../com/boot
    ./hardware
    ./programs
    ./services
    ./home
  ];

  networking.hostName = "orchid";
  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
    wget
    vim
    firefox
    networkmanager
    sof-firmware
  ];

  system.stateVersion = "21.05";

}
