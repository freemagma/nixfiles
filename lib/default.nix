{ lib }:

{
  makeSystem = { self, args, system, nixpkgs, modules ? [ ] }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      modules = modules ++ [
        {
          config._module.args = args;
        }
        {
          nix.registry.nixpkgs.flake = nixpkgs;
          nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        }
      ];
    };
}
