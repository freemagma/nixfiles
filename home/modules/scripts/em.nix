{ pkgs, ... }:

let emacsclient = "${pkgs.emacs}/bin/emacsclient";
in pkgs.writeShellScriptBin "em" ''
  ${emacsclient} -c -a=""
''
