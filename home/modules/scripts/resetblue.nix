{ pkgs, ... }:
pkgs.writeShellScriptBin "resetblue" ''
  bluetoothctl -- connect ''${1}
''
