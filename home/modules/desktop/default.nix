{
  i3 = ./i3;
  polybar = ./polybar;
  rofi = ./rofi;

  bundles.i3 = {
    imports = [
      ./i3
      ./polybar
      ./rofi
    ];
  };
}
