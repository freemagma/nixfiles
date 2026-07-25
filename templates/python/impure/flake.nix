{
  description = "my project description";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      with (import nixpkgs {
        config = { allowUnfree = true; };
        inherit system;
      }); {
        devShells.default = let
          pythonPackages = python3Packages;
        in mkShell rec {
          name = "impurePythonEnv";
          venvDir = "./.venv";
          buildInputs = with pythonPackages; [
            python
            ipython
            venvShellHook
            ###
            # (pytorch.override { cudaSupport = false; })
          ];

          # Run this command, only after creating the virtual environment
          postVenvCreation = ''
            unset SOURCE_DATE_EPOCH
          '';

          # Now we can execute any commands within the virtual environment.
          # This is optional and can be left out to run pip manually.
          postShellHook = ''
            unset SOURCE_DATE_EPOCH
          '';
        };
      });
}
