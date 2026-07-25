{ pkgs, ... }:

let bluetoothctl = "${pkgs.bluez}/bin/bluetoothctl";
in pkgs.writeShellScriptBin "resetblue" ''
  ${bluetoothctl} -- connect ''${1}
''
