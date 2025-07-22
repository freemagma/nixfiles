{ pkgs, ... }:
{
  # command-not-found
  programs.command-not-found.enable = false;

  # Steam
  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;

  # opengl
  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # Sound
  hardware.pulseaudio.enable = false;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Enable = "Source,Sink,Media,Socket";
      };
    };
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.pipewire.wireplumber.configPackages = [
    (pkgs.writeTextDir "share/wireplumber/bluetooth.lua.d/51-bluez-config.lua" ''
      		bluez_monitor.properties = {
      			["bluez5.enable-sbc-xq"] = true,
      			["bluez5.enable-msbc"] = true,
      			["bluez5.enable-hw-volume"] = true,
      			["bluez5.headset-roles"] = "[ hsp_hs hsp_ag hfp_hf hfp_ag ]"
      		}
      	'')
  ];


  # Scanner
  hardware.sane.enable = true;
  hardware.sane.dsseries.enable = true;
}
