{
  nixpkgs.config.allowUnfree = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes ca-derivations

    keep-outputs = true
    keep-derivations = true
  '';
}
