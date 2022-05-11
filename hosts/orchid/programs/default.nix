{ config, ... }:

{
  # Docker
  virtualisation.docker.enable = true;

  # Steam
  programs.steam.enable = true;
  hardware.pulseaudio.support32Bit = true;

  # opengl
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
