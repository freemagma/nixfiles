# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./xserver.nix
      <home-manager/nixos>
    ];

  # Packages to have installed system-wide
  home-manager.useGlobalPkgs = true;
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget curl vim networkmanager sof-firmware
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  # Basic networking settings
  networking.hostName = "orchid";
  networking.networkmanager.enable = true;
  networking.useDHCP = false;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  # Set the time zone.
  time.timeZone = "America/New_York";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound and bluetooth
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.pulseaudio.package = pkgs.pulseaudioFull;
  hardware.bluetooth.enable = true;
  #boot.extraModprobeConfig = ''
  #  snd slots=snd_soc_skl_hda_dsp
  #'';
  #hardware.pulseaudio.extraConfig = ''
  #  load-module module-alsa-sink device=hw:0,0 channels=4
  #  load-module module-alsa-source device=hw:0,6 channels=4
  #'';
  #boot.blacklistedKernelModules = [ "snd_hda_intel" "blacklist snd_soc_skl" ];

  # Define a user account
  users.users.cgunn = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    # shell = pkgs.zsh;
  };
  home-manager.users.cgunn = import "/home/cgunn/.config/nixpkgs/home.nix";

  # Hardware fixes for steam
  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;
  hardware.steam-hardware.enable = true;

  # Leave this value at the release version of the first install of this system.
  system.stateVersion = "20.03";

}

