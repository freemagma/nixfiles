inputs@{ nixpkgs, ... }:

let
  lib = nixpkgs.lib;
in
{
  makeSystem = { system, machine, modules ? [ ] }:
    lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs; };

      modules = modules ++ [
        {
          config._module.args = {
            inherit system machine;
          };
        }
        {
          nix.registry.nixpkgs.flake = nixpkgs;
          nix.nixPath = [ "nixpkgs=${nixpkgs}" ];
        }
      ];
    };

  makeUser =
    { style, username, privileged ? false, extraPkgs ? (_: [ ]), modules ? [ ] }:
    { system, machine, pkgs, ... }:
    {
      users.users.${username} = {
        isNormalUser = true;
        extraGroups =
          if privileged then [ "wheel" "networkmanager" "docker" "scanner" "lp" ]
          else [ "networkmanager" ];
      };
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = {
        _module.args = {
          inherit username system machine style inputs;
        };
        imports = modules;
        home.packages = extraPkgs pkgs;
        home.stateVersion = "21.05";
      };
    };
}
