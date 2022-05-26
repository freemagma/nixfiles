{ nixpkgs, ... }:

{
  makeSystem = { system, machine, modules ? [ ] }:
    nixpkgs.lib.nixosSystem {
      inherit system;
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

  makeUser = { system, machine, style, username, modules ? [ ] }:
    {
      users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" ];
      };
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = {
        _module.args = {
          inherit system machine style;
        };
        imports = modules;
      };
    };
}
