_: { pkgs, ... }:

{
  services.xserver = {
    enable = true;
    layout = "us";

    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-text-editor
    gnome-connections
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    gnome-calculator
    gnome-calendar
    gnome-contacts
    gnome-clocks
    gnome-weather
    gnome-font-viewer
    gnome-maps
    rygel
  ]);
}
