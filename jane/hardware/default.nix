{
    imports = [
        ./hardware-configuration.nix
    ];

    # Networking
    networking.useDHCP = false;
    networking.networkmanager.enable = true;
    networking.interfaces.enp5s0.useDHCP = true;
    networking.interfaces.enp6s0.useDHCP = true;
    networking.interfaces.wlp4s0.useDHCP = true;

    # Sound
    sound.enable = true;
    hardware.pulseaudio.enable = true;
    hardware.bluetooth.enable = true;

    # Scanner
    hardware.sane.enable = true;
    hardware.sane.dsseries.enable = true;
}