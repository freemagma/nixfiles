_: { config, ... }:

let
  nvidia_x11 = config.boot.kernelPackages.nvidia_x11;
  nvidia_gl = nvidia_x11.out;
  nvidia_gl_32 = nvidia_x11.lib32;
in
{
  services.xserver.videoDrivers = [ "nvidia" ];
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;
  };
  systemd.enableUnifiedCgroupHierarchy = false;
  boot.extraModulePackages = [ nvidia_x11 ];
  environment.systemPackages = [ nvidia_x11 ];
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
    extraPackages = [ nvidia_gl ];
    extraPackages32 = [ nvidia_gl_32 ];
  };
}
