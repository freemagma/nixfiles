{ self, ... }:
with self.homeModules;

{
  cgunn = self.lib.makeUser {
    username = "cgunn";
    privileged = true;

    style.color = style.gruvbox-dark;
    modules = [
      pkglist
      neofetch
      kitty
      shell.zsh
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

    style.color = style.gruvbox-dark;
    modules = [
      kitty
      shell.zsh
      desktop.bundles.i3
      scripts.bundles.all
      userdirs
      neovim
    ];
    extraPkgs = p: with p; [
      polymc
    ];
  };
}
