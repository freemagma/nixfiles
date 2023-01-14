{
  # command-not-found
  programs.command-not-found.enable = false;

  # Steam
  programs.steam.enable = true;
  hardware.pulseaudio.support32Bit = true;

  # opengl
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Sound
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  hardware.bluetooth.enable = true;

  # Scanner
  hardware.sane.enable = true;
  hardware.sane.dsseries.enable = true;
}
