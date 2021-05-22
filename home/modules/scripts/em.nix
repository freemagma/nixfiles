{ pkgs, ... }:

pkgs.writeShellScriptBin "em" ''
  emacsclient --create-frame --alternate-editor=""
''
