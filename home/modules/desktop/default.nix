{ self, ... }@inputs:

rec {
  i3 = import ./i3 inputs;
  polybar = import ./polybar inputs;
  rofi = import ./rofi inputs;

  bundles.i3 = {
    imports = [
      i3
      polybar
      rofi
    ];
  };
}
