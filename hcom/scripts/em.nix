{ pkgs, ... }:

pkgs.writeShellScriptBin "em" ''
  emacs -bg "#21242b"
''
