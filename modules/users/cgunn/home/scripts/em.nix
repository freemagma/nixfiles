{ pkgs, ... }:

pkgs.writeShellScriptBin "em" ''
  emacsclient -c -a=""
''
