{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    vim
    firefox
    git
  ];
}
