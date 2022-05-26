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

  makeUser =
    { style, username, privileged ? false, modules ? [ ] }:
    { system, machine, ... }:
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
          inherit system machine style;
        };
        imports = modules;
      };
    };
}
