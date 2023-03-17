{ pkgs, ... }:

let openconnect = "${pkgs.openconnect}/bin/openconnect";
in pkgs.writeShellScriptBin "gtvpn" ''
  sudo ${openconnect} --protocol=gp vpn.gatech.edu -u cgunn30
''
