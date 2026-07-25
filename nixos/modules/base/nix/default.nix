{
  nixpkgs.config.allowUnfree = true;

  nix.extraOptions = ''
    experimental-features = nix-command flakes ca-derivations

    keep-outputs = true
    keep-derivations = true
  '';

  # keep-outputs/keep-derivations retain a lot, so collect and dedupe on a timer
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.optimise.automatic = true;
}
