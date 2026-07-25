inputs:

{
  base = ./base;
  desktop = import ./desktop;
  nvidia = ./nvidia;
  users = import ./users inputs;
  overlays = import ./overlays;
}
