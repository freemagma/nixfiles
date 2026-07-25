_: { config, ... }:

let
  nvidia_x11 = config.boot.kernelPackages.nvidia_x11;
  nvidia_gl = nvidia_x11.out;
  nvidia_gl_32 = nvidia_x11.lib32;
in
{
  services.xserver.videoDrivers = [ "nvidia" ];
  boot.extraModulePackages = [ nvidia_x11 ];
  environment.systemPackages = [ nvidia_x11 ];
  hardware.nvidia.open = false;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = [ nvidia_gl ];
    extraPackages32 = [ nvidia_gl_32 ];
  };
}
