{ pkgs, ... }:

{
  imports = [
    ../../com/xserver
    ../../com/options
    ../../com/boot
    ./hardware
    ./services
    ./programs
    ./home
  ];

  networking.hostName = "jane";
  time.timeZone = "America/New_York";

  environment.systemPackages = with pkgs; [
    wget
    vim
    firefox
    git
  ];

  system.stateVersion = "21.05";
}
