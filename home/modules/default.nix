inputs:

{
  style = import ./style inputs;
  pkglist = import ./pkglist inputs;
  kitty = import ./kitty inputs;
  shell = import ./shell inputs;
  desktop = import ./desktop inputs;
  userdirs = import ./userdirs inputs;
  scripts = import ./scripts inputs;
  git = import ./git inputs;
  emacs = import ./emacs inputs;
  neovim = import ./neovim inputs;
  chess = import ./chess inputs;
}
