{
  description = "my project description";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      with nixpkgs.legacyPackages.${system};
      let
        phxinit = writeShellScriptBin "phxinit" ''
          pg_ctl initdb -D $PGDATA

          HOST_COMMON="host\s\+all\s\+all"
          sed -i "s|^$HOST_COMMON.*127.*$|host all all 0.0.0.0/0 trust|" $PGDATA/pg_hba.conf
          sed -i "s|^$HOST_COMMON.*::1.*$|host all all ::/0 trust|"      $PGDATA/pg_hba.conf

          pgstart
          createuser postgres --host=$PGDATA -ds

          yes | mix local.hex
          yes | mix archive.install hex phx_new
        '';
        pgstart = writeShellScriptBin "pgstart" ''
          pg_ctl -D $PGDATA -l $PGDATA/postgres.log \
            -o "-c unix_socket_directories='$PGDATA'" start
        '';
        pgstop = writeShellScriptBin "pgstop" ''
          pg_ctl -D $PGDATA stop
        '';
      in {
        devShell = mkShell {
          buildInputs =
            [ git elixir nodejs-17_x inotify-tools postgresql phxinit pgstart pgstop ];
          shellHook = ''
            mkdir -p .artifacts
            export ARTIFACT_DIR=$PWD/.artifacts
            export PGDATA=$ARTIFACT_DIR/db
            export MIX_HOME=$ARTIFACT_DIR/mix
            export HEX_HOME=$ARTIFACT_DIR/hex
          '';
        };
      });
}
