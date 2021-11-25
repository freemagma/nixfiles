{ pkgs, ... }:

let openconnect = "${pkgs.openconnect}/bin/openconnect";
in pkgs.writeShellScriptBin "gtvpn" ''
  sudo ${openconnect} anyc.vpn.gatech.edu --authgroup gatech-2fa-Duo
''
