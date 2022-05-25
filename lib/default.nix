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

  makeUser = { self, system, machine, inputs, username, modules ? [ ] }:
    {
      users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" "scanner" "lp" ];
      };
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${username} = {
        _module.args = {
          inherit self system machine inputs;
          style = self.homeModules.style;
        };
        imports = modules;
      };
    };
}
