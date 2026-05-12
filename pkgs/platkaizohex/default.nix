{ pkgs, ... }:
with pkgs;

buildDotnetModule {
  # doesn't work right now :(
  name = "platkaizohex";

  src = fetchFromGitHub {
    owner = "zuils";
    repo = "PlatKaizoHeX";
    rev = "2.0";
    sha256 = "sha256-kgXUDSw26dIVCq4Xtr4M1W0vCeUO2uGIPu1CGMCau7E=";
  };

  dotnet-sdk = dotnetCorePackages.sdk_9_0;
  dotnet-runtime = dotnetCorePackages.runtime_9_0;

  nugetDeps = ./deps.json;

  projectFile = "PKHeX.sln";
}

