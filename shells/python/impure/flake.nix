{
  description = "my project description";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      with (import nixpkgs {
        config = { allowUnfree = true; };
        inherit system;
      }); {
        devShell = let
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
