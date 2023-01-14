{ self, ... }:
with self.homeModules;

{
  cgunn = self.lib.makeUser {
    username = "cgunn";
    privileged = true;

    style.color = style.catppuccin-mocha;
    modules = [
      pkglist
      neofetch
      kitty
      shell.fish
      desktop.bundles.i3
      scripts.bundles.all
      userdirs
      neovim
      chess
    ];
  };

  guest = self.lib.makeUser {
    username = "guest";
    privileged = false;

    style.color = style.catppuccin-mocha;
    modules = [
      kitty
      shell.fish
      desktop.bundles.i3
      scripts.bundles.all
      userdirs
      neovim
    ];
    extraPkgs = p: with p; [
      prismlauncher
      google-chrome
      spotify
    ];
  };
}
